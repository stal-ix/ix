{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/illiliti/libudev-zero/archive/938b959402552483f010401051eb800c04607a41.zip
de426bde2fef6f8a6fef2d089d0bf58a
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
