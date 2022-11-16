{% extends '//lib/lame/t/ix.sh' %}

{% block bld_libs %}
lib/kernel
lib/curses
lib/sndfile
{{super()}}
{% endblock %}
