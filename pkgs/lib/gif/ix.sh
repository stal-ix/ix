{% extends '//die/c/make.sh' %}

{% block pkg_name %}
giflib
{% endblock %}

{% block version %}
5.2.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/giflib/giflib-{{self.version().strip()}}.tar.gz
be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=convert)
{% endblock %}
