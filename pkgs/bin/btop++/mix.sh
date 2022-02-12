{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v1.2.0.tar.gz
sha:59a87b9d0bb0f5010d53f0ac72ddee9fd7b5a4039bce51b94b262313e946df02
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
