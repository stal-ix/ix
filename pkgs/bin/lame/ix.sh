{% extends '//lib/lame/t/ix.sh' %}

{% block bld_libs %}
lib/linux
lib/curses
lib/sndfile
{{super()}}
{% endblock %}
