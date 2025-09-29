{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
p11-kit
{% endblock %}

{% block version %}
0.25.10
{% endblock %}

{% block fetch %}
https://github.com/p11-glue/p11-kit/releases/download/{{self.version().strip()}}/p11-kit-{{self.version().strip()}}.tar.xz
a62a137a966fb3a9bbfa670b4422161e369ddea216be51425e3be0ab2096e408
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
