{% extends '//bin/weechat/static/ix.sh' %}

# check bin/weechat

{% block bld_libs %}
lib/curses
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_NCURSES=ON
ENABLE_HEADLESS=OFF
{% endblock %}
