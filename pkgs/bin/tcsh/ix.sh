{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.12.tar.gz
sha:e3270ce9667fd5bd2a046687659fcf5fd6a6781326f806ebd724f1e1c9cd4185
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
