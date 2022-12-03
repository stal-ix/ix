{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.03.tar.gz
sha:7368bfdfa6d0c8b0040d47c00b3dfc17b501e3bc032d05ce816019aa825798f5
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
