{% extends '//die/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/0.7.0.tar.gz
sha:210ddf8efa1149cde4dd35908bef8e9e63c2edaa0cdb5435f2e6db277fafff3c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bin/scdoc
{% endblock %}

{% block meson_flags %}
defaultpath=/var/run/seatd/seatd.sock
{% endblock %}
