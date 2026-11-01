{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmikmod
{% endblock %}

{% block version %}
3.3.16
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mikmod/libmikmod/{{self.version().strip()}}/libmikmod-{{self.version().strip()}}.tar.gz
7b24e41468b0dfe7fae1104ae6a0d7c52e04a65e1851b268c7074e4d06685a53
{% endblock %}

{% block lib_deps %}
lib/c
{% if darwin %}
lib/darwin/framework/CoreAudio
{% endif %}
{% endblock %}
