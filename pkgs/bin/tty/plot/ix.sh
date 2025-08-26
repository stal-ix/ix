{% extends '//die/c/make.sh' %}

{% block pkg_name %}
ttyplot
{% endblock %}

{% block version %}
1.7.4
{% endblock %}

{% block fetch %}
https://github.com/tenox7/ttyplot/archive/refs/tags/{{self.version().strip()}}.tar.gz
d4a690cb4ca6d52885ebfdc6230bfb550eecf4b8edb9b54453829a77f63ea7b9
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
