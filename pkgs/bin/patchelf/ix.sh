{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.18.0.tar.gz
sha:1451d01ee3a21100340aed867d0b799f46f0b1749680028d38c3f5d0128fb8a7
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
