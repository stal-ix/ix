{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://github.com/celluloid-player/celluloid/archive/refs/tags/v0.27.tar.gz
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
