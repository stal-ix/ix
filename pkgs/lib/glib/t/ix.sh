{% extends 't/ix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glib/2.84/glib-2.84.0.tar.xz
sha:f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a
{% endblock %}

{% block bld_tool %}
bld/meson/4
{{super()}}
{% endblock %}
