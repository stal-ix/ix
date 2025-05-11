{% extends '//lib/gdk/pixbuf/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/png
lib/glib
lib/jpeg
{% endblock %}

{% block meson_flags %}
{{super()}}
builtin_loaders=all
{% endblock %}
