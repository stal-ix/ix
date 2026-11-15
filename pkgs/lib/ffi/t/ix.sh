{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libffi
{% endblock %}

{% block version %}
3.8.1
{% endblock %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d20879cd35dae11feb1d6637e37630a65ca1a10c27eeb8236b77762f9ef003d0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
