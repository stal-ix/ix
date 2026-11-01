{% extends '//die/c/make.sh' %}

{% block pkg_name %}
sl
{% endblock %}

{% block version %}
5.05
{% endblock %}

{% block fetch %}
https://github.com/eyJhb/sl/archive/refs/tags/{{self.version().strip()}}.tar.gz
6c941b526e3d01be7f91a3af4ae20a89d1e5d66b3b2d804c80123b1b1be96384
{% endblock %}

{% block bld_libs %}
lib/c
lib/ncurses
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sl ${out}/bin/
{% endblock %}
