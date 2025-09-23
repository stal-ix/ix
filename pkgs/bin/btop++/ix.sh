{% extends '//die/c/make.sh' %}

{% block pkg_name %}
btop
{% endblock %}

{% block version %}
1.4.5
{% endblock %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0ffe03d3e26a3e9bbfd5375adf34934137757994f297d6b699a46edd43c3fc02
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
