{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.7.2/enchant-2.7.2.tar.gz
sha:7cc3400a6657974a740b6e3c2568e2935c70e5302f07fadb2095366b75ecad6f
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
