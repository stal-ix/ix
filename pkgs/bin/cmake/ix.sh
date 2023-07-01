{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/uv
lib/curl
lib/curses
lib/archive
{{super()}}
{% endblock %}
