{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://github.com/vifm/vifm/archive/refs/tags/v0.12.tar.gz
sha:f145896c1a4237d6aa160e8616f4c600f276729a17958b6a1cf5186276815395
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bin/mandoc
{% endblock %}
