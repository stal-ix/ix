{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Tessil/robin-map/archive/refs/tags/v1.2.1.tar.gz
sha:2b54d2c1de2f73bea5c51d5dcbd64813a08caf1bfddcfdeee40ab74e9599e8e3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
