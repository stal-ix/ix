{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.6.4/enchant-2.6.4.tar.gz
sha:833b4d5600dbe9ac867e543aac6a7a40ad145351495ca41223d4499d3ddbbd2c
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

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
