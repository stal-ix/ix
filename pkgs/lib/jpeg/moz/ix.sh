{% extends '//lib/jpeg/turbo/ix.sh' %}

{% block fetch %}
https://github.com/mozilla/mozjpeg/archive/refs/tags/v4.1.3.tar.gz
sha:f6ce89f616b30c498d1fb3b0f0940914557d8393a79c9e7aafff72032446bca0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{{super()}}
PNG_SUPPORTED=OFF
{% endblock %}
