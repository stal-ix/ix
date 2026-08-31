{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mDNSResponder
{% endblock %}

{% block version %}
2881.120.11
{% endblock %}

{% block fetch %}
https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-{{self.version().strip()}}.tar.gz
f665cf02b5c930f9b70fb39b7567f03dd821997594c56ce399098eaa0372fb15
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
patch mDNSShared/uds_daemon.c << EOF
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
