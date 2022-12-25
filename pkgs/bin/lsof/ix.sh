{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/archive/refs/tags/4.96.4.tar.gz
sha:b5a052cac8d6b2726bbb1de2b98c6d9204c7619263fb63e9b6b1bd6bbb37bf14
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
export LINUX_INCL=${lib_linux_headers}/include
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
