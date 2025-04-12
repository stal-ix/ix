{% extends '//die/c/meson.sh' %}

{% block version %}
1.3.2
{% endblock %}

{% block fetch %}
https://github.com/kaniini/libucontext/archive/refs/tags/libucontext-{{self.version().strip()}}.tar.gz
sha:4faf1838a15d61efe27ddac24fded2c290929eb3a1fefc72f952ae96d5bda006
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
cpu={{target.arch}}
{% endblock %}
