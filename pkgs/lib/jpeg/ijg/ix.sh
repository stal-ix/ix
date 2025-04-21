{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jpeg
{% endblock %}

{% block version %}
9e
{% endblock %}

{% block fetch %}
http://www.ijg.org/files/jpegsrc.v{{self.version().strip()}}.tar.gz
sha:4077d6a6a75aeb01884f708919d25934c93305e49f7e3f36db9129320e6f4f3d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
