{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms2.17.tar.gz
sha:6e6f6411db50e85ae8ff7777f01b2da0614aac13b7b9fcbea66dc56a1bc71418
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
