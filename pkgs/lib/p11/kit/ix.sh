{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
p11-kit
{% endblock %}

{% block version %}
0.25.5
{% endblock %}

{% block fetch %}
https://github.com/p11-glue/p11-kit/releases/download/{{self.version().strip()}}/p11-kit-{{self.version().strip()}}.tar.xz
sha:04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block c_rename_symbol %}
getprogname
{% endblock %}

{% block meson_flags %}
test=false
{% endblock %}
