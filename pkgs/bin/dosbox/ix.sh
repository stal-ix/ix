{% extends '//die/c/autohell.sh' %}

{% block version %}
0.74-3
{% endblock %}

{% block pkg_name %}
dosbox
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/dosbox/dosbox/{{self.version().strip()}}/dosbox-{{self.version().strip()}}.tar.gz
sha:c0d13dd7ed2ed363b68de615475781e891cd582e8162b5c3669137502222260a
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/1
lib/kernel
lib/sdl/deps
{% endblock %}

{% block cxx_flags %}
-Wno-register
{% endblock %}
