{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
p11-kit
{% endblock %}

{% block version %}
0.26.6
{% endblock %}

{% block fetch %}
https://github.com/p11-glue/p11-kit/releases/download/{{self.version().strip()}}/p11-kit-{{self.version().strip()}}.tar.xz
5fda95dc89964af32dbd8e01b139c166717cf96c4fee3d601bcd60bdb23d23c6
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
