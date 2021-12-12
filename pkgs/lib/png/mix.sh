{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.35.tar.gz
d703ed4913fcfb40021bd3d4d35e00b6
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/auto/make/1/16/3/mix.sh
dev/build/auto/conf/2/69/mix.sh
{% endblock %}
