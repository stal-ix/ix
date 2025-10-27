{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
7.5.0
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3cad2f554912ecd77222272e5d1a7c1e5e33b4011bee823269cdc9095d2fdce2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
