{% extends '//die/c/cmake.sh' %}

{% block version %}
3.1.12
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:8a1bc258f3149b5729c2f4f8ffd337c0e57f09096e4ba9784329f40c4a9035da
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
