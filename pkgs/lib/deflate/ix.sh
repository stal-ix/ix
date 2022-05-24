{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.11.tar.gz
sha:c72f691293f41c6aee66d44ca2dcd24092161b312a1c4c3d591d5d25f26b1faf
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
