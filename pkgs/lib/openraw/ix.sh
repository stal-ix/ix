{% extends '//die/c/autohell.sh' %}

{# hard rust dep #}

{% block fetch %}
https://libopenraw.freedesktop.org/download/libopenraw-0.3.5.tar.bz2
sha:9a93d92d55066b9d88df84a58f75095654c31dddb92021b47baa0f3f482fb2e7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jpeg
lib/boost
lib/xml/2
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=rustc)
bld/fake(tool_name=cargo)
{% endblock %}
