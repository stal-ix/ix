{# the null WASI: every wasi_snapshot_preview1 import, answered in-module,
   for the wasm32-none target; part of lib/c there, see lib/c/bare #}

{% extends '//die/inline/library.sh' %}

{% block sources %}
null.c
{% endblock %}
