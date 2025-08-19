{% extends '//lib/glib/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
libelf=disabled
sysprof=disabled
default_library=static
libmount=disabled
{% endblock %}
