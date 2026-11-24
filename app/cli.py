from __future__ import annotations

import sys

import fire

VERSION = "0.1.0"
EXIT_SUCCESS = 0


def show_version() -> None:
    """Print the application version."""
    print(VERSION)


def helloworld(optional_parameter: str | None = None) -> None:
    """Print a Hello World message.

    Args:
        optional_parameter (str | None): Optional message parameter.
    """
    print("Hello, World!")

    if optional_parameter is not None:
        print(f"Optional parameter: {optional_parameter}")


commands = {
    "version": show_version,
    "helloworld": helloworld,
}


def main(args: list[str] | None = None) -> int:
    """Run the requested command.

    Args:
        args (list[str] | None): Command-line arguments.

    Returns:
        int: Application exit code.
    """
    fire.Fire(commands, command=args)
    return EXIT_SUCCESS


if __name__ == "__main__":
    sys.exit(main())
