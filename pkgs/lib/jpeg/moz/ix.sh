{% extends '//lib/jpeg/turbo/ix.sh' %}

{% block fetch %}
https://github.com/mozilla/mozjpeg/archive/refs/tags/v4.1.4.tar.gz
sha:8a5018dc93c08a49fba3aff8d1a0be0a3e26460e315d1db45abb64402935e0db
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{{super()}}
PNG_SUPPORTED=OFF
{% endblock %}
