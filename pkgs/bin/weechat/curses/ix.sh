{% extends '//bin/weechat/static/ix.sh' %}

{% block bld_libs %}
lib/curses
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_NCURSES=ON
ENABLE_HEADLESS=OFF
{% endblock %}
