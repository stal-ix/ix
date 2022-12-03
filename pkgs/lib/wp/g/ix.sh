{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/libwpg/libwpg/libwpg-0.3.3/libwpg-0.3.3.tar.xz
sha:99b3f7f8832385748582ab8130fbb9e5607bd5179bebf9751ac1d51a53099d1c
{% endblock %}

{% block lib_deps %}
lib/c
lib/wp/d
lib/revenge
{% endblock %}
