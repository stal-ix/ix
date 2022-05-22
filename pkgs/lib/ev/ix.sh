{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://fossies.org/linux/misc/libev-4.33.tar.gz
a3433f23583167081bf4acdd5b01b34f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/autohell
{% endblock %}
