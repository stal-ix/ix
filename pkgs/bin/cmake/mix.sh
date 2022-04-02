{% extends '//bin/cmake/t/mix.sh' %}

{% block bld_libs %}
lib/curl
lib/curses
lib/archive
{{super()}}
{% endblock %}
