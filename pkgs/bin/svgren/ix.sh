{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/svgren/archive/refs/tags/0.6.2.tar.gz
sha:277ce8771944f82540824b25126c5d6a0ef399a9a0b123282a9675a074ffd774
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/png
lib/svgren
{% endblock %}

{% block patch %}
sed -e 's|M_OS == M_OS_LINUX|0|' -i tests/render/main.cpp
{% endblock %}

{% block build %}
clang -std=c++17 -o svgren tests/render/main.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp svgren ${out}/bin/
{% endblock %}
