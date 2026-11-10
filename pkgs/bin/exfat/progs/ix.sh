{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
exfatprogs
{% endblock %}

{% block version %}
1.4.4
{% endblock %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/{{self.version().strip()}}.tar.gz
6ffb35a2a2b578019bf33da71836587857c990fb9e998d89eb333757ba779565
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/linux/util
{% endblock %}

{% block cpp_defines %}
loff_t=off_t
{% endblock %}
