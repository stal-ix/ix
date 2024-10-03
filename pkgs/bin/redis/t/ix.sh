{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.4.1.tar.gz
sha:e85fd212307c8b453ae9361e882b6c1cefcc6a988a6f135faf7ef770a13bb05d
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

{% block setup_target_flags %}
export CFLAGS="-Wno-strict-prototypes ${CFLAGS}"
{% endblock %}
