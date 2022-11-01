{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms2.14.tar.gz
sha:05869269f14e589b0b6d05a76f510c68c67fabb304904d16c6bd818abec80a83
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
