{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lowdown
{% endblock %}

{% block version %}
2.0.4
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
d366866f34de35a64a366efcf15dd787960ca25d986bb8780fb04a4306999eec
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
