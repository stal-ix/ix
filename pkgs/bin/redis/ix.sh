{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.7.tar.gz
sha:7a46c27a143cab7eed1ba3965ab69cd2bfc9984b94ddb916c56548c310342e98
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
