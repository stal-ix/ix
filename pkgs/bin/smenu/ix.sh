{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
smenu
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/p-gen/smenu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4903990aa870ced8bea48963a5430af170ad2ba3ffc0d3418fd78970fc470a3c
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
