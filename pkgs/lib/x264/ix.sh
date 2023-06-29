{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://code.videolan.org/videolan/x264
{% endblock %}

{% block git_commit %}
a8b68ebfaa68621b5ac8907610d3335971839d52
{% endblock %}

{% block git_sha %}
9a00b66bdcae1b7a7fdabc2f7c232add13aaa4ba54712d33115ad65ee4e5d800
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
bld/bash
bld/elfutils
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
