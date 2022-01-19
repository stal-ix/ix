{% extends '//bin/bash/5.1.18/t/mix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block bld_tool %}
bin/bison/3/boot
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-nls
--disable-readline
{% endblock %}
