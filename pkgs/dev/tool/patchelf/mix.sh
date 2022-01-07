{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.14.3.tar.gz
b5afebf895e8858f49b36519fdb33cf3
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
