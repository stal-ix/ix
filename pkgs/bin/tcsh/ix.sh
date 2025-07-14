{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tcsh
{% endblock %}

{% block version %}
6.24.16
{% endblock %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-{{self.version().strip()}}.tar.gz
4208cf4630fb64d91d81987f854f9570a5a0e8a001a92827def37d0ed8f37364
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
