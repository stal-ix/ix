{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
celluloid
{% endblock %}

{% block version %}
0.29
{% endblock %}

{% block fetch %}
https://github.com/celluloid-player/celluloid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c4fa8e21647f39253709bad1939fe3d376abd07e05c2c02fb235c23375aa810a
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
