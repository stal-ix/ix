{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libgit2-glib
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libgit2-glib/-/archive/v{{self.version().strip()}}/libgit2-glib-v{{self.version().strip()}}.tar.bz2
sha:e15d98cf15cd9dc8aaae8a11ab44f51f3a0da3ad4ace80ede3831c934e1897d7
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/git/2/old
{% endblock %}

{% block meson_flags %}
ssh=false
python=false
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
