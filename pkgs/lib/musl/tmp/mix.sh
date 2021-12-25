{% extends '//lib/musl/template/mix.sh' %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block bld_libs %}
lib/unwind/mix.sh(sanitize=)
{% endblock %}
