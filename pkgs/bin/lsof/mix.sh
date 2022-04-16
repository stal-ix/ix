{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/releases/download/4.94.0/lsof_4.94.0.linux.tar.bz2
sha:c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b
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
