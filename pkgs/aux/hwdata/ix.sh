{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hwdata
{% endblock %}

{% block version %}
0.401
{% endblock %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e9ff93b9807cc014ed8f7f5cb5dc2c31e714058c82ddc59b7355f5c57c9b759e
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
