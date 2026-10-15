{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build/opt/gc
lib/build/opt/O2
lib/build/opt/LTO
{% if not wasi %}
{# wasm-ld has no ICF #}
lib/build/opt/ICF
{% endif %}
lib/build/opt/sections
{% endblock %}
