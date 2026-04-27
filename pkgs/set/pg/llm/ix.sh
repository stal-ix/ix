{% extends '//die/hub.sh' %}

{% block liib_deps %}
set/pg/llm/libs
{% endblock %}

{% block run_deps %}
bld/sh
bld/box
bin/gdb
bld/make
bin/strace
set/dev/cc
set/dev/cc
set/dev/go
bin/ollama
bin/logcli
bin/tcpdump
bin/etcd/ctl
bin/python/14
bin/ip/route2
set/pg/llm/libs(kind=lib)
{% endblock %}
