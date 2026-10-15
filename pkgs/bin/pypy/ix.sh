{# PyPy with the JIT, and with its cffi stdlib modules linked in.

   Upstream builds those after translation, as shared objects loaded
   by dlopen. Here each one is an archive from lib/pypy/cffi, linked
   into the binary, with its entry point registered in the dl table by
   the matching /dl package, and named here so the frozen importlib
   knows to look for it there rather than on disk.

   _tkinter and _gdbm are left out: one wants a Tcl runtime this
   distribution does not carry, the other a library nothing else here
   uses. #}

{% extends 't/ix.sh' %}

{% block pypy_opt %}
jit
{% endblock %}

{% block pypy_cffi_libs %}
lib/pypy/cffi/util/dl
lib/pypy/cffi/pwdgrp/dl
lib/pypy/cffi/resource/dl
lib/pypy/cffi/syslog/dl
lib/pypy/cffi/posix/shmem/dl
lib/pypy/cffi/lzma/dl
lib/pypy/cffi/sha/3/dl
lib/pypy/cffi/blake/2/b/dl
lib/pypy/cffi/blake/2/s/dl
lib/pypy/cffi/curses/dl
lib/pypy/cffi/sqlite/3/dl
lib/pypy/cffi/ssl/dl
{% endblock %}

{% block pypy_cffi_modules %}
_pypy_util_cffi_inner
_pwdgrp_cffi
_resource_cffi
_syslog_cffi
_posixshmem_cffi
_lzma_cffi
_sha3._sha3_cffi
_blake2._blake2b_cffi
_blake2._blake2s_cffi
_curses_cffi
_sqlite3_cffi
_pypy_openssl
{% endblock %}
