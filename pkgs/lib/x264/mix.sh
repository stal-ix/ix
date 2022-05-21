{% extends '//die/make.sh' %}

{% block fetch %}
https://code.videolan.org/videolan/x264/-/archive/master/x264-master.tar.bz2
sha:37caa704adb0fefd32da6ea6ebeef8e45bb1b84bf1b7f8a7a6f71cc79dd7baa3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
bld/bash
bin/elfutils
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
