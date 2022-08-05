{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.13.tar.gz
sha:0d81f197dc31dc4ef7b6198fde570f4e8653c77f4698fcb2163d820a9607c838
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
