{% extends '//shell/mc/template/template.sh' %}

{% block run_deps %}
{{super()}}
lib/curses/terminfo/mix.sh
{% endblock %}

{% block typ %}
slang
{% endblock %}
