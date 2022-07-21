{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/dosbox/dosbox/0.74-3/dosbox-0.74-3.tar.gz
sha:c0d13dd7ed2ed363b68de615475781e891cd582e8162b5c3669137502222260a
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/1
lib/sdl/deps
{% endblock %}
