{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.8.1/enchant-2.8.1.tar.gz
sha:ff79de470b8eb16f53849dc49f2bce8ca4eb7decabfc1349716fe12616e52f4e
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
