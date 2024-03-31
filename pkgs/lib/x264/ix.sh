{% extends '//die/c/make.sh' %}

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
bld/elfutils
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_target %}
cli
lib-static
{% endblock %}

{% block make_install_target %}
install-cli
install-lib-static
{% endblock %}

{% block configure %}
bash ./configure --prefix=${out}
{% endblock %}

{% block git_version %}
v3
{% endblock %}
