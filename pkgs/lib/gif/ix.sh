{% extends '//die/c/make.sh' %}

{% block pkg_name %}
giflib
{% endblock %}

{% block version %}
6.1.3
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/giflib/giflib-{{self.version().strip()}}.tar.gz
b65b66b99f0424b93525f987386f22fc5efb9da2bfc92ad4a532249aaffbab0e
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
