{% extends '//die/hub.sh' %}

{# this is my home config, for demonstration purposes  #}
{# one can make an overlay in private git repo instead #}

{% block run_deps %}
bin/mc
bin/jq
bin/gh
bin/git
bin/mpv
bin/ted
bin/gdb
bin/sed
bin/foot
bin/make
bin/wget
bin/curl
bin/htop
bin/less
bin/patch
bin/wirez
bin/cmake
bin/ninja
bin/patch
set/debug
bin/wirez
bin/imway
bin/shitty
bin/psmisc
bin/evince
bin/strace
set/dev/cc
set/dev/go
bin/strace
bin/ollama
bin/logcli
bin/bash/5
bin/glslang
bin/im/play
bin/openssl
bin/iwd/ctl
bin/swayimg
bin/tcpdump
bin/unbound
bin/git/lfs
bld/wayland
bin/rip/grep
bin/etcd/ctl
bin/dns/masq
bin/sing/box
bin/xdg/open
bin/python/14
bin/coreutils
bin/diffutils
bin/findutils
bin/gawk/lite
bin/file/host
bin/tun2socks
bin/python/14
bin/ip/route2
bin/pkg/config
bin/codex/wrap
bin/fontconfig
bin/quake/1/vk
bin/grep/patched
bin/grep/scripts
set/box/gnu/tools
bin/python/frozen
bin/brightnessctl
set/pg/user/scripts
bin/claude/code/wrap
bin/minio/client/patched
bin/imway/session(stalix=1)
{% endblock %}

{% block run_data %}
set/fonts/default
aux/fonts/ms/cascadia
{% endblock %}
