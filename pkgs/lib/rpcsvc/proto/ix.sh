{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rpcsvc-proto
{% endblock %}

{% block version %}
1.4.4
{% endblock %}

{% block fetch %}
https://github.com/thkukuk/rpcsvc-proto/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7988641deae8463303b6273d7af98ece09111c385d4c9134a142a5fad3cdfef8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
