{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/xyproto/orbiton/archive/refs/tags/v2.68.0.tar.gz
sha:40662eccfabb55bd13269378ed59d32b84cbaba5c92170c2c43d9a4056c27a46
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
