{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.07.tar.gz
sha:74e4e9805cbd9413ed34b4ffa1d72fc8d0ef81a5b79476854091416ce9336995
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
