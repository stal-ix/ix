{% extends '//die/c/make.sh' %}

{% block pkg_name %}
ttyplot
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/tenox7/ttyplot/archive/refs/tags/{{self.version().strip()}}.tar.gz
e1bed41497936de4b6c7c951ec59bd79e600ef489562aa97e51307bc7d9f3d50
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
