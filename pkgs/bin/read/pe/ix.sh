{% extends '//die/c/make.sh' %}

{% block pkg_name %}
readpe
{% endblock %}

{% block version %}
0.85
{% endblock %}

{% block fetch %}
https://github.com/mentebinaria/readpe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2747a3ee87c7fb1ed0a13242816752a94603adb6ae0d9f507b019ac582c394eb
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/gzip
{% endblock %}
