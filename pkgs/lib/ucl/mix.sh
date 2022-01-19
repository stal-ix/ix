{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
852bd691d8abc75b52053465846fba34
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
