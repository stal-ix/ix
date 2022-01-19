{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.35.tar.gz
d703ed4913fcfb40021bd3d4d35e00b6
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block bld_tool %}
bin/auto/make/1/16
bin/auto/conf/2/69
{% endblock %}
