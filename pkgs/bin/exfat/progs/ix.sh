{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
exfatprogs
{% endblock %}

{% block version %}
1.4.5
{% endblock %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/{{self.version().strip()}}.tar.gz
7f2c8aa42e8c416326573e3b77f4c9984917d037a2158d24123f88d412956680
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
