{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.16.0.tar.gz
sha:e959dfec640471e21a32637ca990f9fc5d979eed02f7b0fe8907d562b89c095f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
