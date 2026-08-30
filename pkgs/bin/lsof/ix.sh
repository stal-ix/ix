{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lsof
{% endblock %}

{% block version %}
4.99.7
{% endblock %}

{% block fetch %}
https://github.com/lsof-org/lsof/archive/refs/tags/{{self.version().strip()}}.tar.gz
bac1b0acbc50aede42fc97dffaa0b0475e97973e36a6351de5f349c6155afc68
{% endblock %}

{% block bld_libs %}
lib/c
lib/tirpc
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bash
bld/shebangs
bld/pkg/config
{% endblock %}

{% block patch %}
fix_shebangs lib/dialects/linux/Mksrc
{% endblock %}

{% block configure %}
export LINUX_INCL=${KERNEL_HEADERS}
bash ./Configure -n linux
{% endblock %}

{% block cpp_defines %}
HASSECURITY=1
HASIPv6=1
NEEDS_NETINET_TCPH=1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lsof ${out}/bin/
{% endblock %}
