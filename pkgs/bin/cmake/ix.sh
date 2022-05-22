{% extends '//bin/cmake/t/ix.sh' %}

{% block bld_libs %}
lib/curl
lib/curses
lib/archive
{{super()}}
{% endblock %}
