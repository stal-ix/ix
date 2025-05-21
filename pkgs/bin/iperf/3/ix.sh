{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iperf
{% endblock %}

{% block version %}
3.19
{% endblock %}

{% block fetch %}
https://github.com/esnet/iperf/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:da5cff29e4945b2ee05dcf9a0c67768cc000dc1b122935bce3492c4e36f6b5e9
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
