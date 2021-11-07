{% extends '//shell/cli/bash/5.1.18/template/template.sh' %}

{% block bashflags %}
--disable-nls
--disable-readline
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
boot/final/env/bison/mix.sh
{% endblock %}
