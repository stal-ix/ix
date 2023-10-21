{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include '//lib/svgren/ver.sh' %}
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
