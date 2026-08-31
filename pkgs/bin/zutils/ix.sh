{% extends '//die/c/make.sh' %}

{% block pkg_name %}
zutils
{% endblock %}

{% block version %}
1.16
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/zutils/zutils-{{self.version().strip()}}.tar.lz
5bb953700e72e7088e2fce13c6224b8ee478bd6ac90197183f85f544189eb37d
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
