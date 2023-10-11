{% extends '//lib/python/3/11/cross/ix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
{% endblock %}

{% block configure_flags %}
{{super()}}
--host=wasm32-wasi
--target=wasm32-wasi
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block configure %}
export CONFIG_SITE=${PWD}/Tools/wasm/config.site-wasm32-wasi
export ac_cv_func_memfd_create=no
export ac_cv_func_pthread_condattr_setclock=no
export ac_cv_func_pthread_detach=no
export ac_cv_have_pthread_t=no
export ac_cv_header_pthread_h=no
{{super()}}
{% endblock %}

{% block ensure_static_build %}
{{super()}}
cp Tools/wasm/Setup.local.example Modules/Setup.local
{% endblock %}
