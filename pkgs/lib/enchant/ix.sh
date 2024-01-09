{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.6.5/enchant-2.6.5.tar.gz
sha:9e8fd28cb65a7b6da3545878a5c2f52a15f03c04933a5ff48db89fe86845728e
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block c_rename_symbol %}
rawmemchr
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=groff)
{% endblock %}

{% block setup %}
export CPPFLAGS="-isystem${PWD}/lib ${CPPFLAGS}"
{% endblock %}
