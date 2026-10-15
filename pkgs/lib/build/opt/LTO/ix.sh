{% extends '//die/env.sh' %}

{% block env %}
{% if wasi %}
{# wasm-ld's ThinLTO backend (LLVM 21) crashes linking executables; the
   full LTO pipeline links the same code fine #}
export CFLAGS="-flto ${CFLAGS}"
{% else %}
export CFLAGS="-flto=thin ${CFLAGS}"
export LDFLAGS="-Wl,--thinlto-jobs=8 ${LDFLAGS}"
{% endif %}
{% endblock %}
