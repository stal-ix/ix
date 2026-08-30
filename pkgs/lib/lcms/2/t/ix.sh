{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
Little-CMS
{% endblock %}

{% block version %}
2.19.1
{% endblock %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms{{self.version().strip()}}.tar.gz
267705e278e2f7c2fb886c259dadcbaeb2be52748bcbc71c79f08aacacb7a709
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
