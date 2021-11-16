{% extends '//shell/cli/bash/5.1.18/template/template.sh' %}

{% block coflags %}
{{super()}}
--disable-nls
--disable-readline
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}
