{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.jedsoft.org/releases/jed/jed-0.99-19.tar.bz2
sha:97a339ce2fb0a446767ee550786e6914fa2e8cdbad39a402e48368cd0d6b5763
{% endblock %}

{% block bld_libs %}
lib/c
lib/slang
{% endblock %}

{% block run_data %}
lib/curses/n/terminfo
{% endblock %}

{% block bld_tool %}
lib/curses/n/terminfo/config
{% endblock %}
