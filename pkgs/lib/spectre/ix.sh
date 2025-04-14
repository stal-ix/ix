{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libspectre
{% endblock %}

{% block version %}
0.2.12
{% endblock %}

{% block fetch %}
http://libspectre.freedesktop.org/releases/libspectre-{{self.version().strip()}}.tar.gz
sha:55a7517cd3572bd2565df0cf450944a04d5273b279ebb369a895391957f0f960
{% endblock %}

{% block lib_deps %}
lib/c
lib/ghost/script
{% endblock %}
