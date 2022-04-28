{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
sha:ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block configure_flags %}
--enable-nasm
{% endblock %}
