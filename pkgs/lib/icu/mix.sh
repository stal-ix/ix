{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-70-1.tar.gz
ebe2080640a063e9237cc41e80034d96
{% endblock %}

{% block unpack %}
{{super()}}
cd icu4c/source
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
dev/tool/python
{% endblock %}

{% block configure_flags %}
--with-data-packaging=archive
{% endblock %}
