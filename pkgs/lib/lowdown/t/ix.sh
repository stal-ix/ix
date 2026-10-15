{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lowdown
{% endblock %}

{% block version %}
3.2.1
{% endblock %}

{% block make_tool %}
bld/make
bin/bmake
{% endblock %}

{% block make_bin %}
bmake
{% endblock %}

{% block fetch %}
https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_{{self.version().strip().replace('.', '_')}}.tar.gz
8501a5efb35b61dc73eabb54a099e21ac1dfaec347bb9c8090660233bcf36dea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure PREFIX=${out}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
