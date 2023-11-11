{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.7.2.tar.gz
sha:63b40acff57467f7d3a64981d4bcff60b52f539fae7688aaaaee27a448b10266
{% endblock %}

{% block cmake_flags %}
ENABLE_UNZIP=OFF
ENABLE_OPENSSL=OFF
{% if linux %}
ENABLE_LIBGCC=OFF
{% endif %}
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
{% if darwin %}
#lib/shim/fake(lib_name=gcc)
{% endif %}
{% endblock %}

{% block build_flags %}
{% if darwin %}
wrap_cc
{% endif %}
{% endblock %}
