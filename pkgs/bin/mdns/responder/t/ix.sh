{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mDNSResponder
{% endblock %}

{% block version %}
2881.0.25
{% endblock %}

{% block fetch %}
https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-{{self.version().strip()}}.tar.gz
aa6718b757dcccb9fc6549e0f566cd03eaa7314426f2856e0da08c966d7da41c
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
