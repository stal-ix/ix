{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/psmisc/psmisc/-/archive/v23.5/psmisc-v23.5.tar.bz2
sha:d443b65f397f3ba8cc36b9fe636b282edf1742a5164fcf8a845718a0d83392e3
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
