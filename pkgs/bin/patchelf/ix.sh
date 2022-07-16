{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.15.0.tar.gz
sha:5d1eda9bad4439bb9c0a87fcba198d7c0d372f361e77de41d68d6308062e5000
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
