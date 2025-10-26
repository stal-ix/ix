{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libucontext
{% endblock %}

{% block version %}
1.3.3
{% endblock %}

{% block fetch %}
https://github.com/kaniini/libucontext/archive/refs/tags/libucontext-{{self.version().strip()}}.tar.gz
06fca63bc00a236ea7e2ce4fe984d7203b1f9ea046f5c8c815d280da4ea281e3
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
