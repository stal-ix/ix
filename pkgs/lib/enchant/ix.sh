{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.7.0/enchant-2.7.0.tar.gz
sha:2a073dc6ebe753196c0674a781ccf321bed25d1c6e43bffb97e2c92af420952c
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

{% block cpp_includes %}
${PWD}/lib
{% endblock %}

{% block configure_flags %}
--enable-relocatable
{% endblock %}
