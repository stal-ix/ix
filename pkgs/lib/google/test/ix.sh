{% extends '//die/c/cmake.sh' %}

{% block version %}
1.16.0
{% endblock %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:78c676fc63881529bf97bf9d45948d905a66833fbfa5318ea2cd7478cb98f399
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
