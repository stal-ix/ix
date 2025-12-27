{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
exfatprogs
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/{{self.version().strip()}}.tar.gz
4ee16035376c51e13f48cb8aca7df840d333ead77cf2caf47c5edc25b2f61c0d
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
