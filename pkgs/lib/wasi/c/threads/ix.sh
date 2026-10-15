{% extends '//lib/wasi/c/t/ix.sh' %}

{% block wasi_target %}
TARGET_TRIPLE=wasm32-wasi-threads
{% endblock %}

{% block env %}
export CFLAGS="-pthread \${CFLAGS}"
export CPPFLAGS="-isystem${out}/include/wasm32-wasi-threads -D_WASI_EMULATED_PTHREAD \${CPPFLAGS}"
export LDFLAGS="-Wl,--shared-memory \${LDFLAGS}"
{{super()}}
{% endblock %}
