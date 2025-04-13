{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
celluloid
{% endblock %}

{% block version %}
0.27
{% endblock %}

{% block fetch %}
https://github.com/celluloid-player/celluloid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6c216a3dead5baf931bd52876cab7e08abcb9aef2132ca3a9ea35bf9dffe7644
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
