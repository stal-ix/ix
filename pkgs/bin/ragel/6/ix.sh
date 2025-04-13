{% extends '//die/c/autorehell.sh' %}

{% block version %}
6.10
{% endblock %}

{% block fetch %}
http://www.colm.net/files/ragel/ragel-{{self.version().strip()}}.tar.gz
sha:5f156edb65d20b856d638dd9ee2dfb43285914d9aa2b6ec779dac0270cd56c3f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
