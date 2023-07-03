{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v0.372.tar.gz
sha:aff121c1c7a7dec58414c5e21151a180d3a23628e21c12e3bef58e063a0dc228
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
