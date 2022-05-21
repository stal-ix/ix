{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/ogg/-/archive/v1.3.5/ogg-v1.3.5.tar.bz2
b1221346a0ed6b6369f8c69a2800050b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
