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
bin/bash
bin/less
set/debug
bin/fuzzel
bin/waybar
bin/evince
bin/openssl
bin/sway/bg
bin/iwd/ctl
bin/swayimg
bin/tcpdump
bin/git/lfs
bin/sing/box
bin/xdg/open
bin/tun2socks
bin/alacritty
bin/fontconfig
bin/brightnessctl
set/pg/user/scripts
bin/coreutils/uutils
bin/minio/client/patched
bin/niri(opengl=mesa/aco,vulkan=mesa/aco)
bin/busybox
{% endblock %}

{% block run_data %}
set/fonts/default
aux/fonts/ms/cascadia
{% endblock %}
