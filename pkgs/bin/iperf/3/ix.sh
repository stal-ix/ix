{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/esnet/iperf/archive/refs/tags/3.16.tar.gz
sha:be859e7168d0c867029e7013a8de273a169b4842ec7c24cd6570af75d5080aa3
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
