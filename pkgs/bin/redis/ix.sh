{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.1.tar.gz
sha:d7519ecda58b243c417ed657de1db95edfc2c87a8f4cca9cbabb02c8fbaeedf1
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block make_flags %}
MALLOC=libc
{% endblock %}
