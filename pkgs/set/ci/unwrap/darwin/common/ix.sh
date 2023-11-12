{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/u/config
bin/assemble
bin/byacc
bin/make
bin/ninja
bin/pkg/config
bin/python/12
bin/dropbear/stock
bin/curl
bin/convert
bin/cmake
bin/bash/3
bin/bash/5
set/box/gnu
set/compress
bin/coreutils
{% endblock %}
