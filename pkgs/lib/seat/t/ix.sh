{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/0.9.0.tar.gz
sha:4276d1380c67e30a63c289b35f7bf955e126e6daf3596cd5aa6080670aa1214c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/scdoc
{% endblock %}

{% block meson_flags %}
defaultpath=/var/run/seatd/seatd.sock
{% endblock %}
