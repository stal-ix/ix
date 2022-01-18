{% extends '//bin/bash/5.1.18/t/mix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3/boot
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-nls
--disable-readline
{% endblock %}
