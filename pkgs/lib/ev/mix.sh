{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://dist.schmorp.de/libev/libev-4.33.tar.gz
a3433f23583167081bf4acdd5b01b34f
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
