{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmikmod
{% endblock %}

{% block version %}
3.3.15
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mikmod/libmikmod/{{self.version().strip()}}/libmikmod-{{self.version().strip()}}.tar.gz
dc27b338154b8f88dc9e6317196d42c6abc13bf63c4e055257a18d4e38e1afa2
{% endblock %}

{% block lib_deps %}
lib/c
{% if darwin %}
lib/darwin/framework/CoreAudio
{% endif %}
{% endblock %}
