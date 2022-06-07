{% extends '//die/make.sh' %}

{% block fetch %}
https://code.videolan.org/videolan/x264/-/archive/master/x264-master.tar.bz2
sha:876383c0bcc7bde562d2db350c4754114e8c4c0ce1228018cad0cc5f4ce1253b
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
