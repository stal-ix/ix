{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v0.8.4.tar.gz
sha:5615c76a61039e283a6bd107c4faf345ae5ad4dcd45907defe5e474d8fdb6fd2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
