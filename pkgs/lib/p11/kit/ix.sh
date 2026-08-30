{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
p11-kit
{% endblock %}

{% block version %}
0.26.5
{% endblock %}

{% block fetch %}
https://github.com/p11-glue/p11-kit/releases/download/{{self.version().strip()}}/p11-kit-{{self.version().strip()}}.tar.xz
f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7
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
