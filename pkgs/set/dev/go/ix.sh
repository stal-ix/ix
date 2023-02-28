{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/go
bld/compiler
bin/clang/env
bin/bash/lite/sh
lib/c(kind=lib)
{% endblock %}
