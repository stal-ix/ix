{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.7.3/enchant-2.7.3.tar.gz
sha:fe6ad4cbe8c71b9384ffdef962be52d4d2bd5ebfb6351435bb390543d4f78b1e
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
