{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/archive/refs/tags/4.99.0.tar.gz
sha:27fca13b6a3682114a489205a89d05d92f1c755e282be1f3590db15b16b2ed06
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
