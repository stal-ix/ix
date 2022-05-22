{% extends '//lib/wayland/t/ix.sh' %}

{% block bld_tool %}
bin/wayland/scanner
{{super()}}
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
{% endblock %}

{% block run_data %}
aux/adwaita/cursors
{% endblock %}

{% block meson_flags %}
{{super()}}
libraries=true
scanner=false
{% endblock %}

{% block cpp_defines %}
XCURSORPATH=\\\"~/.icons:~/.cursors:${ADWAITA_CURSORS}\\\"
{% endblock %}
