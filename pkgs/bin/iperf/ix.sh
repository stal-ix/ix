{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iperf
{% endblock %}

{% block version %}
2.2.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/iperf2/iperf-{{self.version().strip()}}.tar.gz
754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE
{% endblock %}
