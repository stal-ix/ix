{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v1.2.0.tar.gz
sha:
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/range/v3
{% endblock %}

{% block make_flags %}
OPTFLAGS=
{% endblock %}

{% block patch %}
sed -e 's|.*current_procs.erase.*||' -i src/linux/btop_collect.cpp
{% endblock %}
