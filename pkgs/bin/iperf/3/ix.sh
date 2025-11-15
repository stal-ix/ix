{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iperf
{% endblock %}

{% block version %}
3.20
{% endblock %}

{% block fetch %}
https://github.com/esnet/iperf/archive/refs/tags/{{self.version().strip()}}.tar.gz
84640ea0f43831850434e50134d0554b7a94f97fb02e2488ffbe252c9fb05a56
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
