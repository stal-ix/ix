{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
patchelf
{% endblock %}

{% block version %}
0.19.2
{% endblock %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/{{self.version().strip()}}.tar.gz
05e674fcc89ef3ffbd851266d063f45f13bd16facec9839a54d0095b930c6f07
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
