{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cmark
{% endblock %}

{% block version %}
0.31.1
{% endblock %}

{% block fetch %}
https://github.com/commonmark/cmark/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:3da93db5469c30588cfeb283d9d62edfc6ded9eb0edc10a4f5bbfb7d722ea802
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
