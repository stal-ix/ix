{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://downloads.python.org/pypy/pypy3.10-v7.3.17-src.tar.bz2
sha:6ad74bc578e9c6d3a8a1c51503313058e3c58c35df86f7485453c4be6ab24bf7
{% endblock %}

{% block bld_tool %}
bin/pypy/py2
bld/pkg/config
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/kernel
pip/pycparser
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block build %}
cd pypy/goal
python2 ../../rpython/bin/rpython \
    --opt=jit \
    --make-jobs=${make_thrs} \
    --cc=clang \
    targetpypystandalone
{% endblock %}

{% block patch %}
sed -e 's|IS_SUPPORTED = (|IS_SUPPORTED = False and (|' \
    -i rpython/rlib/rvmprof/cintf.py
{% endblock %}
