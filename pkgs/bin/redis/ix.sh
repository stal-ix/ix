{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.4.tar.gz
sha:1eeacd656e6b6e45aee3c4037dd098932979d3853220bbeb84cb35ca7ef6d2ca
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
