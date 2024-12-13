{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/5.2.0.tar.gz
sha:7e11979235c54b7fc00d3821550b5666816bd3dd61148652620687d690571a3d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
