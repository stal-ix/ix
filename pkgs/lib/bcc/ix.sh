{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
bcc
{% endblock %}

{% block version %}
0.31.0
{% endblock %}

{% block git_repo %}
https://github.com/iovisor/bcc
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
54b51eebec81718566e96206780bbbaa99af0698d4a215933a810b56287585dd
{% endblock %}

{% block lib_deps %}
lib/c
lib/xz
lib/bpf
lib/llvm
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
