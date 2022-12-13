{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.06.tar.gz
sha:a8cd0cd1ddc94f870681ccbd09a3511050e9a71e5fe99a2b007941f5e1b2b7a5
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
