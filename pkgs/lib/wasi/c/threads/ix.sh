{% extends '//lib/wasi/c/t/ix.sh' %}

{% block make_flags %}
{{super()}}
THREAD_MODEL=posix
{% endblock %}

{% block build %}
mkdir -p build/wasm32-wasi-threads
{{super()}}
{% endblock %}

{% block env %}
export CFLAGS="-pthread \${CFLAGS}"
export CPPFLAGS="-isystem${out}/include/wasm32-wasi-threads -D_WASI_EMULATED_PTHREAD \${CPPFLAGS}"
export LDFLAGS="-Wl,--shared-memory \${LDFLAGS}"
{{super()}}
{% endblock %}
