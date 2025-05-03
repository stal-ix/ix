{% extends '//lib/glib/t/ix.sh' %}

{% block meson_flags %}
libelf=disabled
sysprof=disabled
default_library=static
libmount=disabled
{% endblock %}

{% block strip_pc %}
{% endblock %}
