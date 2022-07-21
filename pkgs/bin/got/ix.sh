{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.74.tar.gz
sha:5c495209d161db8adfda0a2c8d2d011be54da8b64d2d8798914cb8b7944876fe
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/md
lib/curses
lib/openssl
lib/linux/util
lib/bsd/overlay
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}
