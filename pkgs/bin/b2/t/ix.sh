{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
b2
{% endblock %}

{% block version %}
5.3.3
{% endblock %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/{{self.version().strip()}}.tar.gz
400a4671a58531f53e2b2d9526e6bd0b92535391ff8e906f2e6bd201f7b8c327
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
