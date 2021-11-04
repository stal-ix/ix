{% extends '//shell/mc/template/template.sh' %}

{% block mc_run_deps %}
lib/curses/terminfo/mix.sh
{% endblock %}

{% block typ %}
slang
{% endblock %}
