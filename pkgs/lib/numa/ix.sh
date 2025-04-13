{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
numactl
{% endblock %}

{% block version %}
2.0.19
{% endblock %}

{% block fetch %}
https://github.com/numactl/numactl/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:8b84ffdebfa0d730fb2fc71bb7ec96bb2d38bf76fb67246fde416a68e04125e4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
