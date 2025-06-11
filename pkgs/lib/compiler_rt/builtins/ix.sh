{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux and armv7 %}
lib/compiler_rt/builtins/hack
{% elif linux %}
lib/compiler_rt/builtins/{{crt_ver or clang_ver or default_clang}}
{% else %}
# TODO(pg): fix builtins for darwin
lib/compiler_rt/builtins/hack
{% endif %}
lib/shim/fake(lib_name=atomic)
{% endblock %}
