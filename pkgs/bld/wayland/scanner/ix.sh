{% extends '//bin/wayland/scanner/ix.sh' %}

{% block meson_cross %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/expat
{% endblock %}

{% block meson_flags %}
{{super()}}
dtd_validation=false
{% endblock %}
