{% extends '//die/hub.sh' %}

{# this is my home config, for demonstration purposes  #}
{# one can make an overlay in private git repo instead #}

{% block run_deps %}
bin/mc
bin/git
bin/mpv
bin/ted
bin/mako
bin/grim
bin/wget
bin/curl
bin/htop
bin/niri
bin/bash
bin/less
set/debug
bin/fuzzel
bin/python
bin/waybar
bin/evince
bin/iwd/ctl
bin/swayimg
bin/epiphany
bin/telegram
bin/xdg/open
bin/alacritty
bin/fontconfig
bin/brightnessctl
bin/coreutils/uutils
{% endblock %}

{% block run_data %}
aux/fonts/inter
set/fonts/default
{% endblock %}
