{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
celluloid
{% endblock %}

{% block version %}
0.28
{% endblock %}

{% block fetch %}
https://github.com/celluloid-player/celluloid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:2a0838f08d4bed8ae78a168f9353ac9b9dee08db2f9f38351f3ab9592211678a
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
