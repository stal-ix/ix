{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/esnet/iperf/archive/refs/tags/3.17.1.tar.gz
sha:105b4fe7fbce31c9b94a3fec10c46e3b4b298adc076e1e3af52b990e1faf2db9
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
