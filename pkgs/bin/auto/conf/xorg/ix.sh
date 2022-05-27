{% extends '//die/autohell.sh' %}

{% block fetch %}
https://www.x.org/pub/individual/util/util-macros-1.19.3.tar.bz2
4be6df7e6af52e28e13dc533244eb9d7
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16/5
{% endblock %}

{% block strip_pc %}
: actually need it
{% endblock %}
