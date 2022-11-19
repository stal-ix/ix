{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/jtheoof/swappy/archive/refs/tags/v1.5.0.tar.gz
sha:6d076bc1e8173a320a9cbcf6f910a5fdde7ec73b3ef6cdb16e8d3c442cbbf769
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/pango
lib/cairo
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/gettext
bld/glib/codegen
{% endblock %}
