{% extends '//die/make.sh' %}

{% block fetch %}
https://www.kernel.org/pub/software/network/iw/iw-5.16.tar.xz
sha:4c44e42762f903f9094ba5a598998c800a97a62afd6fd31ec1e0a799e308659c
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/linux
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/pkg/config
{% endblock %}

{% block make_flags %}
SBINDIR="${out}/bin"
{% endblock %}
