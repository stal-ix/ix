{% extends '//lib/jpeg/turbo/mix.sh' %}

{% block fetch %}
https://github.com/mozilla/mozjpeg/archive/refs/tags/v4.0.3.tar.gz
c6910ca8f0ee82a8c0243dc5b7217aba
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{{super()}}
PNG_SUPPORTED=OFF
{% endblock %}
