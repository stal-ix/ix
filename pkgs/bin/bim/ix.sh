{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bim
{% endblock %}

{% block version %}
3.1.0
{% endblock %}

{% block fetch %}
https://github.com/klange/bim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:33e0c4705d6f1fb8c9d3f34730b205a3e9c2233caa7c7442dc12499c640bad9d
{% endblock %}

{% block bld_libs %}
lib/c
lib/kuroko
{% endblock %}
