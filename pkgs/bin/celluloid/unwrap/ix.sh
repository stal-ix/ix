{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://github.com/celluloid-player/celluloid/archive/refs/tags/v0.26.tar.gz
sha:6a66297544dd7754557d03e22e67ef4c1028ba667a7ad7db0d6fe76a137a937c
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/mpv
lib/glib
lib/adwaita
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{{super()}}
{% endblock %}

{% block patch %}
cat << EOF > meson-post-install.py
#!/usr/bin/env python3
EOF
{% endblock %}
