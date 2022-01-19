{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/sass/sassc/archive/refs/tags/3.6.2.tar.gz
4c3b06ce2979f2a9f0a35093e501d8bb
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sass
{% endblock %}
