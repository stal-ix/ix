{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.2.2.tar.gz
sha:0eca4e7aa16f5f411242a2e082863dbb266c0263141fdfd571302b02adf62594
{% endblock %}

{% block bld_libs %}
lib/c
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
USE_SYSTEMD=no
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-strict-prototypes ${CFLAGS}"
{% endblock %}
