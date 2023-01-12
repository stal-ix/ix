{% extends '//lib/python/3/10/ix.sh' %}

{% block bld_libs %}
{% if linux %}
bld/boot/7/lib/linux
{% endif %}
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
bld/boot/7/lib/z
bld/boot/7/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block patch_ffi %}
{% endblock %}

{% block setup %}
{% endblock %}

{% block env %}
{% endblock %}
