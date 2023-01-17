{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/archive/refs/tags/4.97.0.tar.gz
sha:633fb6bdceb672bc09f8943ad54d4d105fff27caa728c775d9c3d08b147890cc
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
