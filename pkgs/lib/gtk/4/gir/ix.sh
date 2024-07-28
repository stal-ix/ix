{% extends '//lib/gtk/4/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/gdk/pixbuf/gir
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
{% endblock %}

{% block meson_flags %}
{{super()}}
introspection=enabled
{% endblock %}
