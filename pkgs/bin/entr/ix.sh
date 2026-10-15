{% extends '//die/c/make.sh' %}

{% block pkg_name %}
entr
{% endblock %}

{% block version %}
5.9
{% endblock %}

{% block fetch %}
https://github.com/eradman/entr/archive/refs/tags/{{self.version().strip()}}.tar.gz
0ef2ce7db728167844a91904944cd07c7ccc6fd3041b849cad861224d106a845
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE
_LINUX_PORT
{% endblock %}

{% block cpp_flags %}
-Imissing
{% endblock %}

{% block patch %}
cp Makefile.linux Makefile
{% endblock %}
