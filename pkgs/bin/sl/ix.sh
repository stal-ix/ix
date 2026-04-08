{% extends '//die/c/make.sh' %}

{% block pkg_name %}
sl
{% endblock %}

{% block version %}
5.02
{% endblock %}

{% block fetch %}
https://github.com/mtoyoda/sl/archive/refs/tags/{{self.version().strip()}}.tar.gz
1e5996757f879c81f202a18ad8e982195cf51c41727d3fea4af01fdcbbb5563a
{% endblock %}

{% block bld_libs %}
lib/c
lib/ncurses
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sl ${out}/bin/
{% endblock %}
