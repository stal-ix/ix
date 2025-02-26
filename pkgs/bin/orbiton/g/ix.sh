{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
sha:e7124e04dfe1ec77c6a0dac0a2e7de7b0478c7c3513a6438df22be740b5a5c2d
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
