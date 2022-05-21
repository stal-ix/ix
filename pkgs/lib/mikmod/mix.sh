{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.11.1/libmikmod-3.3.11.1.tar.gz
sha:ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
