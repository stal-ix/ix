{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
editline
{% endblock %}

{% block version %}
2.1.0
{% endblock %}

{% block fetch %}
https://github.com/troglobit/editline/archive/refs/tags/{{self.version().strip()}}.tar.gz
79edb757aac2a092d46b7a2a30bc1edd9d020a9762974d8b548f044c73bd3b34
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
