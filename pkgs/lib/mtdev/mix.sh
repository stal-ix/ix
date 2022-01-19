{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://bitmath.org/code/mtdev/mtdev-1.1.6.tar.bz2
bf8ef2482e84a00b5db8fbd3ce00e249
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
