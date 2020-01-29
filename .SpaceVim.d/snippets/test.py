#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest


class Test(unittest.TestCase):
    def test_method(self):
        self.assertEqual(True, False)


if __name__ == '__main__':
    unittest.main(verbosity=2)
