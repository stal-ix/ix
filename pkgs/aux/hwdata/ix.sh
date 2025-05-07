{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hwdata
{% endblock %}

{% block version %}
0.395
{% endblock %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1166f733c57afa82cfdad56e62ef044835fbc8c99ef65f033e6a5802716b5c66
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
