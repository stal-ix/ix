{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/autoconf-archive/autoconf-archive-2023.02.20.tar.xz
sha:71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}
