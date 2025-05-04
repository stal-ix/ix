{% extends '//die/c/make.sh' %}

# check bin/transmission/cli

{% block pkg_name %}
libnatpmp
{% endblock %}

{% block version %}
20230423
{% endblock %}

{% block fetch %}
https://miniupnp.tuxfamily.org/files/libnatpmp-{{self.version().strip()}}.tar.gz
sha:0684ed2c8406437e7519a1bd20ea83780db871b3a3a5d752311ba3e889dbfc70
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
INSTALLPREFIX=${out}
{% endblock %}

{% block install %}
{{super()}}
cp natpmp_declspec.h ${out}/include/
{% endblock %}
