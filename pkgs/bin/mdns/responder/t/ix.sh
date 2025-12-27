{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mDNSResponder
{% endblock %}

{% block version %}
2881.40.18
{% endblock %}

{% block fetch %}
https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-{{self.version().strip()}}.tar.gz
b04b88a579fbc303f32d8c8194d5562b7b825f3f3ff52e883c6300038ff30b34
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
