{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms2.16.tar.gz
sha:cb4bf968aa66e3d5d16d1f094a99595966d4330cbd6be46c66129f2747ad2b0d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
