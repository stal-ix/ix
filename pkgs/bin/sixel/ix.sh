{% extends '//lib/sixel/ix.sh' %}

{% block bld_libs %}
lib/gd
lib/curl
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
libcurl=enabled
{% endblock %}
