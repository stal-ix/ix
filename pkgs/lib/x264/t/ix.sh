{% extends '//die/c/configure.sh' %}

{% block git_repo %}
https://code.videolan.org/videolan/x264
{% endblock %}

{% block git_commit %}
a8b68ebfaa68621b5ac8907610d3335971839d52
{% endblock %}

{% block git_sha %}
654c686533c2a1dcf60611f7245edb90cdbae47653f1ed5b39cdadba33313ea8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/nasm
bld/bash
{% endblock %}

{% block configure %}
export STRINGS=llvm-strings
{{super()}}
{% endblock %}

{% block configure_shell %}
bash
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--host={{target.gnu.three}}
{% endblock %}
