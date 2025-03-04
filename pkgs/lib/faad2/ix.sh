{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/2.11.2.tar.gz
sha:3fcbd305e4abd34768c62050e18ca0986f7d9c5eca343fb98275418013065c0e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
