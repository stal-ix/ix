{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
b2
{% endblock %}

{% block version %}
5.4.2
{% endblock %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/{{self.version().strip()}}.tar.gz
ea896b678bc1972233cc7671b78c276a39f2cb9ebfd8a4e22b7fd00c7d95b0be
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
