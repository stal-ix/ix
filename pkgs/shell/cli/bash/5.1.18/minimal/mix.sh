{% extends '//shell/cli/bash/5.1.18/template/template.sh' %}

{% block configure_flags %}
{{super()}}
--disable-nls
--disable-readline
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block bld_libs %}lib/c/mix.sh{% endblock %}
