{% extends '//lib/wasi/c/t/ix.sh' %}

{% block make_flags %}
{{super()}}
THREAD_MODEL=simple
{% endblock %}

{% block build %}
mkdir -p build/wasm32-wasi
{{super()}}
{% endblock %}

{% block env %}
export ac_cv_func_pthread_condattr_setclock=no
export ac_cv_func_pthread_detach=no
export ac_cv_have_pthread_t=no
export ac_cv_header_pthread_h=no
export CPPFLAGS="-isystem${out}/include/wasm32-wasi \${CPPFLAGS}"
export CMFLAGS="-DLIBCXX_ENABLE_THREADS=OFF \${CMFLAGS}"
export CMFLAGS="-DLIBCXXABI_ENABLE_THREADS=OFF \${CMFLAGS}"
{{super()}}
{% endblock %}
