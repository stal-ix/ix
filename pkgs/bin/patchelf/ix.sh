{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.16.1.tar.gz
sha:50e07dd71e2bb88fff043aa6b126b413b0951da848498fe0f2ad38af6650d405
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
