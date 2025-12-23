{% extends '//die/c/make.sh' %}

{% block pkg_name %}
xxHash
{% endblock %}

{% block version %}
0.8.3
{% endblock %}

{% block fetch %}
https://github.com/Cyan4973/xxHash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}
