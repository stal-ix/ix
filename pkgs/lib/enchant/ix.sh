{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.6.2/enchant-2.6.2.tar.gz
sha:6686a728e56e760f8dee09a22f0fb53b46ee9dbe7d64cf9e5bb35a658bff7e1d
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
