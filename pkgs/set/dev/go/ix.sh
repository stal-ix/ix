{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/go/lang
bin/bash/lite/sh
{% if cgo %}
bin/go/lang/env/cgo
bld/compiler
bin/clang/env
lib/c(kind=lib)
{% else %}
bin/go/lang/env/pure
{% endif %}
{% endblock %}
