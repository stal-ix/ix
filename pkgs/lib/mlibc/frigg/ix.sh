{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/managarm/frigg/archive/945c186154ef434c4cf8946c8b429c6cf4910b95.zip
sha:244b017cb078943311992129f2f17758c9ced4cb96e3ebad2ca22e416f94512c
{% endblock %}

{% block meson_flags %}
build_tests=disabled
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
