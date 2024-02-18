{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/capnproto/capnproto/archive/refs/tags/v1.0.2.tar.gz
sha:3cfd0ed58080d78b3a3381305489f2175cdaf1ef1cb55425d8fc8246a76bdff3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
