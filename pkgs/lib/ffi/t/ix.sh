{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libffi
{% endblock %}

{% block version %}
3.5.2
{% endblock %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dd19253d3007f366319a51d248a40c9e5fcace4498cbea990b566291844e4e30
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
