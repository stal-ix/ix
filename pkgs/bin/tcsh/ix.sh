{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-6.24.10.tar.gz
sha:13475c0fbeb74139d33ed793bf00ffbbb2ac2dc9fb1d44467a410760aba36664
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
