{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.09.tar.gz
sha:c2e78a0c837c673410fe4b14de412bb642dc2dc61f56776e052860f82ad9eb9e
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
