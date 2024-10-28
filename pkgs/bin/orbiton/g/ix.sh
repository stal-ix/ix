{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/xyproto/orbiton/archive/refs/tags/v2.68.1.tar.gz
sha:fc881e6d5d7686d98026bcd3b99531a010bd6b787a01fb239b0d766668a2eee3
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
