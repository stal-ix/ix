{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://dev.yorhel.nl/download/ncdu-1.17.tar.gz
sha:810745a8ed1ab3788c87d3aea4cc1a14edf6ee226f764bcc383e024ba56adbf1
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/curses
{% endblock %}
