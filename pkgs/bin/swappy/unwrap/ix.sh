{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swappy
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block fetch %}
https://github.com/jtheoof/swappy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5c0d9b473bf123514e8aa6ccfcb865d61d117ad0a5f7687a18e98f9746ea4d8b
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/pango
lib/cairo
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/glib
bin/scdoc
bld/gettext
{% endblock %}
