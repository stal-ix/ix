{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ogg
{% endblock %}

{% block version %}
1.3.5
{% endblock %}

{% block fetch %}
https://gitlab.xiph.org/xiph/ogg/-/archive/v{{self.version().strip()}}/ogg-v{{self.version().strip()}}.tar.bz2
sha:ff13fbddfd0ad5d3bc3ed5b62cb04edc13014d8072e954490dae65f16fa5a47a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
