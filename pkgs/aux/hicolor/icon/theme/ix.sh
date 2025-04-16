{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
hicolor-icon-theme
{% endblock %}

{% block version %}
0.18
{% endblock %}

{% block fetch %}
https://icon-theme.freedesktop.org/releases/hicolor-icon-theme-{{self.version().strip()}}.tar.xz
sha:db0e50a80aa3bf64bb45cbca5cf9f75efd9348cf2ac690b907435238c3cf81d7
{% endblock %}

{% block run_data %}
{{super()}}
{% if target_realm %}
aux/hicolor/icon/fix
{% endif %}
{% endblock %}
