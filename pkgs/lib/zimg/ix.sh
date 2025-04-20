{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
zimg
{% endblock %}

{% block version %}
3.0.5
{% endblock %}

{% block fetch %}
https://github.com/sekrit-twc/zimg/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:a9a0226bf85e0d83c41a8ebe4e3e690e1348682f6a2a7838f1b8cbff1b799bcf
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
