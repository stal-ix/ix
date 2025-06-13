{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
b2
{% endblock %}

{% block version %}
5.3.2
{% endblock %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/{{self.version().strip()}}.tar.gz
a59c4e6093daad38f5f70fa7d83f93afeeca9c56a51e009009b7e3088735cc3e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
