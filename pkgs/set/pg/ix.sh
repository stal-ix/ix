{% extends '//die/hub.sh' %}

{# this is my home config, for demonstration purposes  #}
{# one can make an overlay in private git repo instead #}

{% block run_deps %}
bin/mc
bin/ted
bin/wget
bin/curl
bin/htop
bin/niri
bin/bash
bin/less
set/debug
bin/ssh/3
bin/waybar
bin/iwd/ctl
bin/alacritty
set/stalix/gui
aux/fonts/inter
bin/brightnessctl
{% endblock %}
