{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/3.0.tar.gz
sha:acc6e49ec9638d4a75578f161945567d52bfcb85da998212adaef6328f5bdcc5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
