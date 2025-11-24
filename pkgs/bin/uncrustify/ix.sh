{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uncrustify
{% endblock %}

{% block version %}
0.82.0
{% endblock %}

{% block fetch %}
https://github.com/uncrustify/uncrustify/archive/refs/tags/uncrustify-{{self.version().strip()}}.tar.gz
e05f8d5ee36aaa1acfa032fe97546b7be46b1f4620e7c38037f8a42e25fe676f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
