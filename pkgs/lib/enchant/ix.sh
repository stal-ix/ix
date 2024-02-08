{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.6.7/enchant-2.6.7.tar.gz
sha:a1c2e5b59acca000bbfb24810af4a1165733d407f2154786588e076c8cd57bfc
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

{% block setup_target_flags %}
export CPPFLAGS="-isystem${PWD}/lib ${CPPFLAGS}"
{% endblock %}
