{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.7.1/enchant-2.7.1.tar.gz
sha:a1cb8239095d6b0bd99ba2dd012a1402cef1a194f5de1b7214bd528676a65229
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
