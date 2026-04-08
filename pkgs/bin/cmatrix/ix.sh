{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cmatrix
{% endblock %}

{% block version %}
2.0
{% endblock %}

{% block fetch %}
https://github.com/abishekvashok/cmatrix/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ad93ba39acd383696ab6a9ebbed1259ecf2d3cf9f49d6b97038c66f80749e99a
{% endblock %}

{% block bld_libs %}
lib/c
lib/ncurses
{% endblock %}
