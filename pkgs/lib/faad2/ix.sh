{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
faad2
{% endblock %}

{% block version %}
2.11.2
{% endblock %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/{{self.version().strip()}}.tar.gz
3fcbd305e4abd34768c62050e18ca0986f7d9c5eca343fb98275418013065c0e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
