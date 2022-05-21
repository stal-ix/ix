{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/emersion/mako/archive/refs/tags/v1.6.tar.gz
sha:9f43cba9e1b43c69be8c9e4a79c358b3cd22153ca3ffb8bf0ee7aa30c59b2fc2
{% endblock %}

{% block lib_deps %}
lib/c
lib/basu
lib/cairo
lib/pango
lib/wayland
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/wayland/protocols
{% endblock %}

{% block run_deps %}
bin/jq
bin/basuctl
{% endblock %}
