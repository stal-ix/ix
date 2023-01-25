{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gdb/reloc
bin/iwd
bin/gdb
bin/git
bin/dash
bin/bash
bin/curl
bin/wget
bin/sway
bin/foot
bin/make
bin/ninja
bin/bsdtar
#bin/convert
set/box/gnu
bin/coreutils
{% endblock %}
