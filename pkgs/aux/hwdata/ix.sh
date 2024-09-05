{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v0.387.tar.gz
sha:8c6be8f0863a8ff5c83b2c46aa525b503b30d42792ed57891c40849de543e1ee
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
