{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/archive/refs/tags/4.98.0.tar.gz
sha:80308a614508814ac70eb2ae1ed2c4344dcf6076fa60afc7734d6b1a79e62b16
{% endblock %}

{% block bld_libs %}
lib/c
lib/tirpc
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bash
bld/pkg/config
{% endblock %}

{% block configure %}
export LINUX_INCL=${KERNEL_HEADERS}
bash ./Configure -n linux
{% endblock %}

{% block cpp_defines %}
HASSECURITY=1
NEEDS_NETINET_TCPH=1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lsof ${out}/bin/
{% endblock %}

{% block setup %}
export CPPFLAGS="-Wno-implicit-function-declaration ${CPPFLAGS}"
{% endblock %}
