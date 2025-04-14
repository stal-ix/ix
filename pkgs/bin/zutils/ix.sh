{% extends '//die/c/make.sh' %}

{% block pkg_name %}
zutils
{% endblock %}

{% block version %}
1.14
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/zutils/zutils-{{self.version().strip()}}.tar.lz
sha:0225a7cbe3bdeade33ef08323d7fe7fb0c6edb1e8e0955287d50b21b7b5d989e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}
