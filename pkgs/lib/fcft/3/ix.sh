{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fcft
{% endblock %}

{% block version %}
3.3.3
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/{{self.version().strip()}}.tar.gz
c0d8d485b45b1af829f73101d6588f404a32bf3c7543236b1a4707d44be81b60
{% endblock %}

{% block lib_deps %}
lib/c
lib/tllist
lib/pixman
lib/freetype
lib/harfbuzz
lib/utf8/proc
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
{% endblock %}
