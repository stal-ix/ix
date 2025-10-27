{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
exfatprogs
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/{{self.version().strip()}}.tar.gz
4f9707d8af3479d661a4a3c095c219d417c20785d9dc4d048b61c6023288f7d2
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block cpp_defines %}
loff_t=off_t
{% endblock %}
