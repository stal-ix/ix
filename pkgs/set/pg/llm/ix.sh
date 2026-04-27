{% extends '//die/hub.sh' %}

{% block liib_deps %}
set/pg/llm/libs
{% endblock %}

{% block run_deps %}
bld/sh
bld/box
bld/make
set/dev/cc
set/dev/cc
set/dev/go
bin/ollama
bin/logcli
bin/etcd/ctl
bin/python/14
set/pg/llm/libs(kind=lib)
{% endblock %}
