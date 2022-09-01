{% extends '//die/c/make.sh' %}

{% block fetch %}
https://code.videolan.org/videolan/x264/-/archive/f7074e12d90de71f22aebd5040b8c6d31ca8f926/x264-f7074e12d90de71f22aebd5040b8c6d31ca8f926.tar.bz2
sem:b744975b70126ab7e1cf07b662e47eccb76aac225370dc6793a769f66eff31b8
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
