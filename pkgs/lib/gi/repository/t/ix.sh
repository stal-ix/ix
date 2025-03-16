{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/python
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block meson_tool %}
bld/meson/4
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
