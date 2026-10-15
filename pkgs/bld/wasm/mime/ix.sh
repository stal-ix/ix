{# wasm-mime: a loader on WAMR for a pure module with the MIME ABI of
   lib/magic/wasm: magic_mime(data, len) names the type of the bytes.
   Feeds a file to it, prints the type, asks again in the same instance,
   as a host reusing an instance does, and requires the same answer.
   bld/wasm/mime(jit=1) runs on the fast-JIT libiwasm instead of the
   interpreter. #}

{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% if jit %}
lib/iwasm/fast
{% else %}
lib/iwasm
{% endif %}
{% endblock %}

{% block name %}
wasm-mime
{% endblock %}

{% block sources %}
loader.c
{% endblock %}
