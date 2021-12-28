{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.ijg.org/files/jpegsrc.v9d.tar.gz
ad7e40dedc268f97c44e7ee3cd54548a
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
