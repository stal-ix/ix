{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/uncrustify/uncrustify/archive/refs/tags/uncrustify-0.80.0.tar.gz
sha:8df1a4fb9aeb6c59d21fd328bb8fd34be7a11aef24310636df5cadca0900c729
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
