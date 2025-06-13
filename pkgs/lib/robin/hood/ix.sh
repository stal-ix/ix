{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
robin-hood-hashing
{% endblock %}

{% block version %}
3.11.3
{% endblock %}

{% block fetch %}
https://github.com/martinus/robin-hood-hashing/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:dcf2b7fa9ef9dd0c67102d94c28e8df3effbe1845e0ed1f31f4772ca5e857fc4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cmake_flags %}
RH_STANDALONE_PROJECT=OFF
{% endblock %}
