{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
Little-CMS
{% endblock %}

{% block version %}
2.17
{% endblock %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms{{self.version().strip()}}.tar.gz
6e6f6411db50e85ae8ff7777f01b2da0614aac13b7b9fcbea66dc56a1bc71418
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
