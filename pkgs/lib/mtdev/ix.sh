{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mtdev
{% endblock %}

{% block version %}
1.1.7
{% endblock %}

{% block fetch %}
https://bitmath.org/code/mtdev/mtdev-{{self.version().strip()}}.tar.bz2
sha:a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2340c97f2ff1d814e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
