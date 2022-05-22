{% extends '//die/make.sh' %}

{% block fetch %}
http://haddonthethird.net/m4/m4-2.tar.bz2
sha:e4315fef49b08912b1d1db3774dd98f971397b2751c648512b6c8d852590dc50
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
