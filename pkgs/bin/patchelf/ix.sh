{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.17.2.tar.gz
sha:039f755bd3533f92cc07b8034419117c763d8a97a909aefbef6a6ecf86e679fc
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
