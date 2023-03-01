{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v0.368.tar.gz
sha:d3db5f4d08a0ba2e4d776fba507662399816e75a14af78bd25dd3c8f2fb8e951
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
