{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.14.tar.gz
sha:89e7df898c37c3427b0f39aadcf733731321a278771d20fc553f92da8d4808ac
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
