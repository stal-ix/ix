{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/iovisor/bcc
{% endblock %}

{% block git_branch %}
v0.31.0
{% endblock %}

{% block git_sha %}
2a8d0c3818a1210e4c9cfe410d86623ae189ce1e1724154eeadf07a46bacd18c
{% endblock %}

{% block lib_deps %}
lib/c
lib/xz
lib/bpf
lib/llvm/19
lib/elfutils
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/fakegit
bin/bpf/tool
pip/setuptools
bld/llvm/config
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block cmake_flags %}
REVISION=0.31.0
ENABLE_EXAMPLES=OFF
ENABLE_MAN=OFF
ENABLE_TESTS=OFF
CMAKE_USE_LIBBPF_PACKAGE=ON
{% endblock %}
