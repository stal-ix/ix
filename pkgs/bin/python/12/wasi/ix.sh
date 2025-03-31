{% extends '//lib/python/3/12/ix.sh' %}

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

{% block autoreconf %}
{% endblock %}

{% block configure %}
export CONFIG_SITE=${PWD}/Tools/wasm/config.site-wasm32-wasi
{{super()}}
{% endblock %}

{% block ensure_static_build %}
{{super()}}
cp Tools/wasm/Setup.local.example Modules/Setup.local
{% endblock %}
