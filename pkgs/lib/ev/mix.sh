{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://dist.schmorp.de/libev/libev-4.33.tar.gz
a3433f23583167081bf4acdd5b01b34f
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}
