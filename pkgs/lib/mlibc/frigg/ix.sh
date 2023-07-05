{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/managarm/frigg
{% endblock %}

{% block git_commit %}
945c186154ef434c4cf8946c8b429c6cf4910b95
{% endblock %}

{% block git_sha %}
d229c1d108d4a9fa0d1dfc1fb06c4a7ccbc1a44c6834a4bac8eb33eb2b903900
{% endblock %}

{% block meson_flags %}
build_tests=disabled
{% endblock %}

{% block bld_libs %}
lib/musl/pure
{% endblock %}
