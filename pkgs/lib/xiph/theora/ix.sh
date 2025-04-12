{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://github.com/xiph/theora/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e0c35771b425c32a052ffb358a2aed14219340ab850b48dc85b01939c0513a31
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
lib/xiph/vorbis
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
