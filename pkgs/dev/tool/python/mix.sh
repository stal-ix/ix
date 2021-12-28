{% extends '//lib/python/3/10/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ffi
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{{super()}}
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block extra_tests %}
{% endblock %}

{% block setup %}
{% endblock %}

{% block env %}
{% endblock %}
