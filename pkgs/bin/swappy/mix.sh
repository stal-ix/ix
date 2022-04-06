{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/jtheoof/swappy/archive/refs/tags/v1.4.0.tar.gz
sha:1b1f26fb283d6bb441581b39826e6c254546131e0a2e568de96f4089a1f9ba66
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
bld/glib/codegen
{% endblock %}
