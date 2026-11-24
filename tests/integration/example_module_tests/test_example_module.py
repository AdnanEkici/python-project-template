from __future__ import annotations

import unittest

from app.example_module.example import add


class IntegrationTestExample(unittest.TestCase):
    def test_add_positive_numbers(self) -> None:
        self.assertEqual(add(2, 3), 5)

    def test_add_negative_numbers(self) -> None:
        self.assertEqual(add(-2, -3), -5)

    def test_add_zero(self) -> None:
        self.assertEqual(add(5, 0), 5)

    def test_add_mixed_numbers(self) -> None:
        self.assertEqual(add(-2, 3), 1)
