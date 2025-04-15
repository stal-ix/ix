{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
b2
{% endblock %}

{% block version %}
5.3.1
{% endblock %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:25df18355fb47749aaac67c71d80c0c1373f5fd0a93541f4b30755b892126b12
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
