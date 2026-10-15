#!/usr/bin/env python3
"""Compile one stdlib module to C.

Usage: ix_cythonize <dotted module name> <source .py> <output .c>
"""

import sys

from Cython.Compiler import Options

# Much of the stdlib puts names into its own globals at runtime rather
# than assigning them where Cython can see: enum's global_enum,
# globals().update(SomeFlag.__members__), and so on. Cython's default is
# to refuse the module; what it does instead is exactly right, emitting
# __Pyx_GetModuleGlobalName, which reads the module dict first and
# builtins after, the same order CPython uses. re, inspect, calendar,
# ssl, http.client, plistlib and turtle all need this.
Options.error_on_unknown_names = False

from Cython.Compiler.Main import main

module, source, output = sys.argv[1:4]
sys.argv = ['cython', '-3', '--module-name', module, '-o', output, source]
main(command_line=1)
