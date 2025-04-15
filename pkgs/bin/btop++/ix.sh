{% extends '//die/c/make.sh' %}

{% block pkg_name %}
btop
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ac0d2371bf69d5136de7e9470c6fb286cbee2e16b4c7a6d2cd48a14796e86650
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
{% endblock %}

{% block make_flags %}
OPTFLAGS=
{% endblock %}

{% block patch %}
sed -e 's|.*current_procs.erase.*||' -i src/linux/btop_collect.cpp
{% endblock %}
