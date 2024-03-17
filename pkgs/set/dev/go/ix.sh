{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/go/lang
bin/bash/lite/sh
{% if cgo %}
bld/compiler
bin/clang/env
lib/c(kind=lib)
bin/go/lang/env/cgo
{% else %}
bin/go/lang/env/pure
{% endif %}
{% endblock %}
