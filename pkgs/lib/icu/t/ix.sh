{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-72-1.tar.gz
sha:43cbad628d98f37a3f95f6c34579f9144ef4bde60248fa6004a4f006d7487e69
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
bld/python
{% endblock %}

{% block configure_flags %}
--with-data-packaging=archive
{% endblock %}
