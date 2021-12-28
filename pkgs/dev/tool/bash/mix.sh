{% extends '//shell/cli/bash/5.1.18/t/mix.sh' %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3/boot/mix.sh
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-nls
--disable-readline
{% endblock %}
