{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/1.2.7.tar.gz
sha:dadf6c58ecc58572d6a482c66a5c60fea2ca71a7df293be6b6008d7cdcebe99a
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
