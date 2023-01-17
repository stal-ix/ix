{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.8.tar.gz
sha:0e439cbc19f6db5a4c63d355519ab73bf6ac2ecd47df806c14b19564b3d0c593
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
