{% extends '//die/hub.sh' %}

{# this is my home config, for demonstration purposes  #}
{# one can make an overlay in private git repo instead #}

{% block run_deps %}
bin/mc
bin/jq
bin/gh
bin/git
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
bin/psmisc
bin/strace
set/dev/cc
set/dev/go
bin/ollama
bin/logcli
bin/bash/5
bin/glslang
bin/openssl
bin/iwd/ctl
bin/tcpdump
bin/git/lfs
bld/wayland
bin/etcd/ctl
bin/xdg/open
bin/python/14
bin/coreutils
bin/diffutils
bin/findutils
bin/gawk/lite
bin/file/host
bin/ip/route2
bin/pkg/config
bin/codex/wrap
bin/fontconfig
bin/quake/1/vk
bin/im/session
bin/grep/patched
bin/grep/scripts
set/box/gnu/tools
set/pg/user/scripts
bin/claude/code/wrap
{% endblock %}

{% block run_data %}
set/fonts/default
aux/fonts/ms/cascadia
{% endblock %}
