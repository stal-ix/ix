{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hwdata
{% endblock %}

{% block version %}
0.394
{% endblock %}

{% block fetch %}
https://github.com/vcrhonek/hwdata/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b7c3fd7214a3b7c49d2661db127a712dc11cffd1799f793947aa1cb20aaf3298
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
