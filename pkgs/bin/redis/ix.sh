{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.10.tar.gz
sha:5be1f61c8ce4216e0ca80c835def3a16eb4a29fa80b2ecd04943eacac9d038ea
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
