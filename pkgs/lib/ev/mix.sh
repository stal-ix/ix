{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
#http://dist.schmorp.de/libev/libev-4.33.tar.gz
https://fossies.org/linux/misc/libev-4.33.tar.gz
a3433f23583167081bf4acdd5b01b34f
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
