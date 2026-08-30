{% extends '//die/c/make.sh' %}

{% block pkg_name %}
ttyplot
{% endblock %}

{% block version %}
1.7.6
{% endblock %}

{% block fetch %}
https://github.com/tenox7/ttyplot/archive/refs/tags/{{self.version().strip()}}.tar.gz
37347a11899c5bfdb5f15fd69766fc5bdfdcb434aa82ae3e9dd10095c3266675
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
