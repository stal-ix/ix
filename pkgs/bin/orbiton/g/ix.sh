{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
sha:36510204d12f607dff6952ab80ee4fcad1cd5be873a41d2c8006a47ea5d9ebe9
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gtk/3
lib/vte/3
{% endblock %}

{% block build %}
cc -o og gtk3/main.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp og ${out}/bin/
{% endblock %}
