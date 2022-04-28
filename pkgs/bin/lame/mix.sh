{% extends '//lib/lame/t/mix.sh' %}

{% block bld_libs %}
lib/curses
lib/sndfile
{{super()}}
{% endblock %}
