{% extends '//die/c/make.sh' %}

{% block pkg_name %}
btop
{% endblock %}

{% block version %}
1.4.7
{% endblock %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
933de2e4d1b2211a638be463eb6e8616891bfba73aef5d38060bd8319baeefc6
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
