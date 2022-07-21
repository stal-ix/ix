{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/releases/download/4.95.0/lsof_4.95.0.linux.tar.bz2
sha:e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c
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
