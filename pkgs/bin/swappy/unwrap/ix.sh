{% extends '//die/c/meson.sh' %}

{% block version %}
1.5.1
{% endblock %}

{% block fetch %}
https://github.com/jtheoof/swappy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:266fac289d4b903d80d44746044bafe8a8b663c6032be696c651ad390bcb1850
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
