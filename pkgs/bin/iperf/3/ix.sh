{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iperf
{% endblock %}

{% block version %}
3.18
{% endblock %}

{% block fetch %}
https://github.com/esnet/iperf/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:ef9ffabf16926701a11c9b7e95dccdf64ff304b7b20dcb6f28aed06b240b7e99
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
