{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
haveged
{% endblock %}

{% block version %}
1.9.27
{% endblock %}

{% block fetch %}
https://github.com/jirka-h/haveged/archive/refs/tags/v{{self.version().strip()}}.tar.gz
098ec77c32bbb185f81eeabec93d67139c50573fe671286cba8a3d9dc865f310
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
