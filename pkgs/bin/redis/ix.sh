{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.3.tar.gz
sha:a98ff50176c4dfec0921dec2b6e5f733674c861debf7c470d52248031e01e999
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
