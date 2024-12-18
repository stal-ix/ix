{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
sha:d9eea18c482248d725a478e8f57f5e99e08ef756b9f70312edc4ea0f7d21a194
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
