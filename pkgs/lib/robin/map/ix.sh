{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Tessil/robin-map/archive/refs/tags/v1.4.0.tar.gz
sha:7930dbf9634acfc02686d87f615c0f4f33135948130b8922331c16d90a03250c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
