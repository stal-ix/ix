{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/go
bin/bash/lite/sh
{% if cgo %}
bld/compiler
bin/clang/env
lib/c(kind=lib)
bin/go/env/cgo
{% else %}
bin/go/env/pure
{% endif %}
{% endblock %}
