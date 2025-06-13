{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lowdown
{% endblock %}

{% block version %}
2.0.2
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
9718c0f6c99a2cef923357feced0e0f86d8047260238c5c37fd2b51ca620e373
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
