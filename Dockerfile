FROM ubuntu:24.04 AS base

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_HTTP_TIMEOUT=120 \
    UV_LINK_MODE=copy \
    UV_PYTHON_INSTALL_DIR=/opt/python

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:0.11.32 /uv /bin/uv

RUN uv python install 3.11

ENV VIRTUAL_ENV=/opt/venv

RUN uv venv --python 3.11 --seed ${VIRTUAL_ENV}

ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

WORKDIR /workspace


FROM base AS development

ENV PYTHONPATH=/workspace \
    PRE_COMMIT_HOME=/home/developer/.cache/pre-commit

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        openssh-client \
        curl \
        wget \
        less \
        vim \
        nano \
        tree \
        htop \
        procps \
        sudo \
        build-essential \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN if id ubuntu >/dev/null 2>&1; then \
        userdel -r ubuntu; \
    fi \
    && useradd \
        --create-home \
        --uid 1000 \
        --shell /bin/bash \
        --groups sudo \
        developer \
    && echo "developer ALL=(ALL) NOPASSWD:ALL" \
        > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer

COPY requirements.txt /tmp/requirements.txt

RUN --mount=type=cache,target=/root/.cache/uv \
    uv pip install -r /tmp/requirements.txt

RUN mkdir -p \
        /workspace \
        /home/developer/.cache/uv \
        /home/developer/.cache/pre-commit \
    && chown -R developer:developer \
        /workspace \
        /home/developer \
        /opt/venv

USER developer

WORKDIR /workspace

CMD ["sleep", "infinity"]
