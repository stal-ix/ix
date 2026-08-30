{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
patchelf
{% endblock %}

{% block version %}
0.19.1
{% endblock %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/{{self.version().strip()}}.tar.gz
39cd33c4810f10ec479d22b8ee6cf8e7acb77c356f3864e3270e2d45f7d23448
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
