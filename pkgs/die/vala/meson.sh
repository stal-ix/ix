{% extends '//die/c/meson.sh' %}

{% block std_box %}
{{super()}}
bld/gir
bin/vala
bld/glib
{% endblock %}
