{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmikmod
{% endblock %}

{% block version %}
3.3.13
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mikmod/libmikmod/{{self.version().strip()}}/libmikmod-{{self.version().strip()}}.tar.gz
9fc1799f7ea6a95c7c5882de98be85fc7d20ba0a4a6fcacae11c8c6b382bb207
{% endblock %}

{% block lib_deps %}
lib/c
{% if darwin %}
lib/darwin/framework/CoreAudio
{% endif %}
{% endblock %}
