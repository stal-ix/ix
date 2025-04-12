{% extends '//die/c/make.sh' %}

{% block pkg_name %}
btop
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:331d18488b1dc7f06cfa12cff909230816a24c57790ba3e8224b117e3f0ae03e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block make_flags %}
OPTFLAGS=
{% endblock %}

{% block patch %}
sed -e 's|.*current_procs.erase.*||' -i src/linux/btop_collect.cpp
{% endblock %}
