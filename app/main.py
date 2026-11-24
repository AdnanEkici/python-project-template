from __future__ import annotations

import argparse
import sys

EXIT_SUCCESS = 0


def main(optional_parameter: str | None = None) -> int:
    """Run the application.

    Args:
        optional_parameter (str | None): Optional message parameter.

    Returns:
        int: Application exit code.
    """
    print("Hello, World!")

    if optional_parameter is not None:
        print(f"Optional parameter: {optional_parameter}")

    return EXIT_SUCCESS


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--optional_parameter", type=str, default=None)
    args = parser.parse_args()

    sys.exit(main(optional_parameter=args.optional_parameter))
