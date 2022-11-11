{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v0.6.2.tar.gz
sha:3e7f2fc243a6a68d6c909b701cfa0db6422ec33fccf91ea5ab7beda3eb798672
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
