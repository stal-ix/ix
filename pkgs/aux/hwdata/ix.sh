{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hwdata
{% endblock %}

{% block version %}
0.404
{% endblock %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5c14fc99bf193faad1ccc267ccfff14ee4e4550a582b17a76aec72178539f837
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out} --datarootdir=${out}/share
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export HWDATA_DIR=${out}/share/hwdata
{% endblock %}
