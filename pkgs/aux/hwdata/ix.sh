{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v0.379.tar.gz
sha:b98ef646d530d5fd3afa3180efbf7c8e22d3da0088f5836f41ee25380d87b092
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
