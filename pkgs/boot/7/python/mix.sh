{% extends '//lib/python/3/10/mix.sh' %}

{% block bld_libs %}
{% if target.os == 'linux' %}
boot/7/lib/linux
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration
{% endif %}
boot/7/lib/z
boot/7/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
boot/6/env/std
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block extra_tests %}
{% endblock %}

{% block patch_ffi %}
{% endblock %}

{% block setup %}
{% endblock %}

{% block env %}
{% endblock %}
