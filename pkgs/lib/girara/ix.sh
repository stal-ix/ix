{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
girara
{% endblock %}

{% block version %}
2026.07.18
{% endblock %}

{% block fetch %}
https://github.com/pwmt/girara/archive/refs/tags/{{self.version().strip()}}.tar.gz
841ca1d6fc33f87ca0065208052dffd7c49489cfd1119ce572176c1d5428a1e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
lib/json/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}
