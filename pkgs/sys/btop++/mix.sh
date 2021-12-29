{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/3cc19a511c24dcbb43e406ef44c8e153f3522099.zip
48d0d3cff18fbe658409cfe6f5ad4b12
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
