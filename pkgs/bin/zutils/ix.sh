{% extends '//die/c/make.sh' %}

{% block pkg_name %}
zutils
{% endblock %}

{% block version %}
1.15
{% endblock %}

{% block fetch %}
https://download.savannah.gnu.org/releases/zutils/zutils-{{self.version().strip()}}.tar.lz
sha:05e6b03f333eabd78a1055139557e8ada6b634f1a58e8501f3b8f111a705cb87
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
