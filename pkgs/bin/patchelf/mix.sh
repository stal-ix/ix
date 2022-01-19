{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.14.3.tar.gz
b5afebf895e8858f49b36519fdb33cf3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
