{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lsof-org/lsof/archive/refs/tags/4.96.5.tar.gz
sha:e9030af1123ff052ab69e12ef55b8a17dc47ac4bccfba85ee1ca1f31acf29607
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
