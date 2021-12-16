{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/ninja-build/ninja/archive/refs/tags/v1.10.2.tar.gz
639f75bc2e3b19ab893eaf2c810d4eb4
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/c++/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}
