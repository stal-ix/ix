{% extends '//die/c/make.sh' %}

{% block pkg_name %}
ttyplot
{% endblock %}

{% block version %}
1.7.3
{% endblock %}

{% block fetch %}
https://github.com/tenox7/ttyplot/archive/refs/tags/{{self.version().strip()}}.tar.gz
a1abc172bba435a0302de9b31ccc66183a7dd2d3480180253cf2feb973c01268
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
