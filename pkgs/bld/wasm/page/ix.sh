{# wasm-page: a loader on WAMR for a pure module with the page ABI, the
   exports lib/pdf/ium/wasm and lib/djvulibre/wasm make under a prefix of
   their own. Opens a file through the module, renders a page, writes the
   pixels and says how many carry ink; renders it twice in one instance,
   as a viewer does. bld/wasm/page(jit=1) runs on the fast-JIT libiwasm
   instead of the interpreter. #}

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
wasm-page
{% endblock %}

{% block sources %}
loader.c
{% endblock %}
