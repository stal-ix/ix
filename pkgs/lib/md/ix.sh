{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libmd
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libmd-{{self.version().strip()}}.tar.xz
1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
