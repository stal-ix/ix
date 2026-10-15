{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
xorgproto
{% endblock %}

{% block version %}
2026.1
{% endblock %}

{% block fetch %}
https://www.x.org/releases/individual/proto/xorgproto-{{self.version().strip()}}.tar.xz
f9bfe4a9ed8c8ab9d2a3b0d49797f046052dadd06b7a8b45dbffaffb137e8290
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block postinstall %}
:
{% endblock %}
