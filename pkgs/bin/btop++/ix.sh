{% extends '//die/c/make.sh' %}

{% block pkg_name %}
btop
{% endblock %}

{% block version %}
1.4.4
{% endblock %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
98d464041015c888c7b48de14ece5ebc6e410bc00ca7bb7c5a8010fe781f1dd8
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
