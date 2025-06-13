{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
desktop-file-utils
{% endblock %}

{% block version %}
0.28
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xdg/desktop-file-utils/-/archive/{{self.version().strip()}}/desktop-file-utils-{{self.version().strip()}}.tar.bz2
cf81ab80b672a54b3858cb1b28d6ac02b84a3085151cbed92c6a2457643304fd
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
{% endblock %}
