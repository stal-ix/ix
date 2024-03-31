{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/managarm/frigg
{% endblock %}

{% block git_commit %}
945c186154ef434c4cf8946c8b429c6cf4910b95
{% endblock %}

{% block git_sha %}
ef5fb6c25cc3c87b040be18758c26e02c998da9fd018b835149be6f132f5bf9b
{% endblock %}

{% block meson_flags %}
build_tests=disabled
{% endblock %}

{% block bld_libs %}
lib/musl/pure
{% endblock %}
