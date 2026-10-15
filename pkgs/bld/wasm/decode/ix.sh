{# wasm-decode: a loader on WAMR for a pure module with the decode() ABI
   (see lib/image/magick/wasm). Feeds a file to decode(ptr, len), reads
   the {width, height, rgba[]} block back, and either dumps it or compares
   it with a reference within a tolerance. bld/wasm/decode(jit=1) runs on
   the fast-JIT libiwasm instead of the interpreter. #}

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
wasm-decode
{% endblock %}

{% block sources %}
loader.c
{% endblock %}
