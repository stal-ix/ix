{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
xorgproto
{% endblock %}

{% block version %}
2025.1
{% endblock %}

{% block fetch %}
https://www.x.org/releases/individual/proto/xorgproto-{{self.version().strip()}}.tar.xz
56898c716c0578df8a2d828c9c3e5c528277705c0484381a81960fe1a67668e8
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block postinstall %}
:
{% endblock %}
