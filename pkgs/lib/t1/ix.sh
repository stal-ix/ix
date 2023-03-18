{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.ibiblio.org/pub/Linux/libs/graphics/t1lib-5.1.2.tar.gz
sha:821328b5054f7890a0d0cd2f52825270705df3641dbd476d58d17e56ed957b59
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=dvips)
bld/fake(tool_name=latex)
bld/fake(tool_name=makeindex)
{% endblock %}
