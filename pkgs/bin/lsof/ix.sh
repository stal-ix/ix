{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/archive/refs/tags/4.96.3-freebsd.tar.gz
sha:bcb673c547d234da327a8ee0d1ef59d3b7eac12e0c066242ec13cb706485560d
{% endblock %}

{% block bld_libs %}
lib/c
lib/tirpc
lib/linux
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bash
bld/pkg/config
{% endblock %}

{% block configure %}
export LINUX_INCL=${lib_linux}/include
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
