{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libucontext
{% endblock %}

{% block version %}
1.5.2
{% endblock %}

{% block fetch %}
https://github.com/kaniini/libucontext/archive/refs/tags/libucontext-{{self.version().strip()}}.tar.gz
9230397327bbf580e04c9456d1509e9af19599c7f6deca7f75969ece6e9d598e
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
