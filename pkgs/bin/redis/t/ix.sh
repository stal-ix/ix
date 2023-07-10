{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.12.tar.gz
sha:13d4689454e29e7b9f1161b544e6d08b0ddd27d057859fde7b1916869b3bf701
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
