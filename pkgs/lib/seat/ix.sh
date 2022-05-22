{% extends '//die/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/0.6.4.tar.gz
sha:3d4ac288114219ba7721239cafee7bfbeb7cf8e1e7fd653602a369e4ad050bd8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block meson_flags %}
defaultpath=/var/run/seatd/seatd.sock
{% endblock %}
