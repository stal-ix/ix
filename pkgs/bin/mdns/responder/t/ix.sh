{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mDNSResponder
{% endblock %}

{% block version %}
2559.1.1
{% endblock %}

{% block fetch %}
https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-{{self.version().strip()}}.tar.gz
sha:f3c4d25c572ae6e64e42e906672d410898fd3f3c59ed538d46c20de8d7725ed0
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/mbedtls/2
{% endblock %}

{% block unpack %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|/var/run|/var/run/mdnsd|g' -i "${l}"
done
patch mDNSShared/dnssd_clientstub.c << EOF
{% include '0.diff' %}
EOF
cd mDNSPosix
{% endblock %}

{% block make_flags %}
os=linux
CC=clang
CXX=clang++
OPTIONALTARG=
{% endblock %}

{% block cpp_missing %}
limits.h
sys/param.h
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
