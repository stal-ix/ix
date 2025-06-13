{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uncrustify
{% endblock %}

{% block version %}
0.81.0
{% endblock %}

{% block fetch %}
https://github.com/uncrustify/uncrustify/archive/refs/tags/uncrustify-{{self.version().strip()}}.tar.gz
484623dc16b92206adc6ac0770077c6c67c6e441102148c2a121a19549330ff9
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
