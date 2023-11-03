{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.2.3.tar.gz
sha:afd656dbc18a886f9a1cc08a550bf5eb89de0d431e713eba3ae243391fb008a6
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
