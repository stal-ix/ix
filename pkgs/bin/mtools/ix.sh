{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mtools
{% endblock %}

{% block version %}
4.0.50
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-{{self.version().strip()}}.tar.lz
6adccaf371081efb6cf2fe687c88746c0978bafeb9deed5c2b03992704a1a6ab
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
