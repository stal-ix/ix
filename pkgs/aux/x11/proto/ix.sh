{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
xorgproto
{% endblock %}

{% block version %}
2024.1
{% endblock %}

{% block fetch %}
https://www.x.org/releases/individual/proto/xorgproto-{{self.version().strip()}}.tar.xz
372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block postinstall %}
:
{% endblock %}
