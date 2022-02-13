{% extends '//lib/input/t/mix.sh' %}

{% block bld_libs %}
lib/gtk/3
{{super()}}
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{{super()}}
{% endblock %}
