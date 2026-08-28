{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lowdown
{% endblock %}

{% block version %}
3.1.1
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
6676ff3c37f4958615906dae6c03ecd24c40509fd85c06acc98f55fa77e2d61c
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
