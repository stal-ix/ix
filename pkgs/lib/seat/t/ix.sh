{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/0.8.0.tar.gz
sha:a562a44ee33ccb20954a1c1ec9a90ecb2db7a07ad6b18d0ac904328efbcf65a0
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
