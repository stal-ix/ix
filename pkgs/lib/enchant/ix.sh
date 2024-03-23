{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.6.8/enchant-2.6.8.tar.gz
sha:f565923062c77f3d58846f0558d21e6d07ca4a488c58812dfdefb35202fac7ae
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
