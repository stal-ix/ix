{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hwdata
{% endblock %}

{% block version %}
0.402
{% endblock %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e390fe2f5f5ef7ed9ccbe62eb7cd40d4ee2b57389e7869c0dc96433c81812e7a
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
