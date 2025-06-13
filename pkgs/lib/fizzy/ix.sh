{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fizzy
{% endblock %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://github.com/wasmx/fizzy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ccccae0043749dc0246af59ef4ef5439a49d33b5a73499a855546bb32f6c5364
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
