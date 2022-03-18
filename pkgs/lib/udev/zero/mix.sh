{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/illiliti/libudev-zero/archive/4154cf252c17297f98a8ca33693ead003b4509da.zip
sha:899491a0b64d0bd7c42f98149d48aaba36cbf94e68e72448835185b631f1cecc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% import '//mix/hooks.sh' as hooks %}

{% block setup_tools %}
{{hooks.wrap_c_compilers()}}
{% endblock %}
