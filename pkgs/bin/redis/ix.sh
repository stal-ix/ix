{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.2.tar.gz
sha:8f0f6a738281b995fd698095a18065fd3fde5ee55c3229498a669ab21bdaf9cc
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
