{% extends '//mix/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/0.6.3.tar.gz
0d375928bbcc39b1652e2730e01e6089
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
libseat-builtin=enabled
defaultpath=/var/run/seatd/seatd.sock
{% endblock %}
