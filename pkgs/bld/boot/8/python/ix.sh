{% extends '//lib/python/3/10/ix.sh' %}

{% block bld_libs %}
{% if linux %}
bld/boot/8/lib/linux
{% endif %}
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
bld/boot/8/lib/z
{% endblock %}

{% block bld_deps %}
bld/boot/7/env/std
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block patch_ffi %}
{% endblock %}

{% block setup_target_flags %}
{% endblock %}

{% block env %}
{% endblock %}
