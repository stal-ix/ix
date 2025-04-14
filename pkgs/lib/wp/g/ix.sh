{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libwpg
{% endblock %}

{% block version %}
0.3.3
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/libwpg/libwpg/libwpg-{{self.version().strip()}}/libwpg-{{self.version().strip()}}.tar.xz
sha:99b3f7f8832385748582ab8130fbb9e5607bd5179bebf9751ac1d51a53099d1c
{% endblock %}

{% block lib_deps %}
lib/c
lib/wp/d
lib/revenge
{% endblock %}
