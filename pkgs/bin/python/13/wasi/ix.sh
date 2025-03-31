{% extends '//lib/python/3/13/ix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/mpdecimal
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-ipv6
--host=wasm32-wasi
--target=wasm32-wasi
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block configure %}
export CONFIG_SITE=${PWD}/Tools/wasm/config.site-wasm32-wasi
export py_cv_module_fcntl=n/a
export py_cv_module__posixsubprocess=n/a
{{super()}}
{% endblock %}

{% block ensure_static_build %}
{{super()}}
cp Tools/wasm/Setup.local.example Modules/Setup.local
{% endblock %}
