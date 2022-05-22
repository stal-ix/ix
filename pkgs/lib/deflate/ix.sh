{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.10.tar.gz
sha:5c1f75c285cd87202226f4de49985dcb75732f527eefba2b3ddd70a8865f2533
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
