{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
celluloid
{% endblock %}

{% block version %}
0.30
{% endblock %}

{% block fetch %}
https://github.com/celluloid-player/celluloid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
75ff83f650180cf9fa2458a7015fa84fd3be014e9478d670f9cf94367720313e
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/mpv
lib/glib
lib/adwaita
lib/gtk/deps
{% endblock %}

{% block patch %}
cat << EOF > meson-post-install.py
#!/usr/bin/env python3
EOF
{% endblock %}
