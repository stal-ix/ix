{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://code.videolan.org/videolan/x264
{% endblock %}

{% block git_commit %}
a8b68ebfaa68621b5ac8907610d3335971839d52
{% endblock %}

{% block git_branch %}
master
{% endblock %}

{% block git_sha %}
b51b5e49de2d9f7d199351a142e1b3a5739a4576fe50c50c2be0c24cf11d164a
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
