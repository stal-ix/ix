{% extends '//lib/jpeg/turbo/ix.sh' %}

{% block fetch %}
https://github.com/mozilla/mozjpeg/archive/refs/tags/v4.0.3.tar.gz
sha:4f22731db2afa14531a5bf2633d8af79ca5cb697a550f678bf43f24e5e409ef0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{{super()}}
PNG_SUPPORTED=OFF
{% endblock %}
