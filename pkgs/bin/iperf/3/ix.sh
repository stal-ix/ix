{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iperf
{% endblock %}

{% block version %}
3.19.1
{% endblock %}

{% block fetch %}
https://github.com/esnet/iperf/archive/refs/tags/{{self.version().strip()}}.tar.gz
85e480d7fffdcb1368888aaee9d76bcfc211e17c2a6dcb2060b281498f82c97b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
