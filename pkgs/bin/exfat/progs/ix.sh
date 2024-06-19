{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/1.2.4.tar.gz
sha:62b48bddd19c49ca0ebef44a836856be1917531717d6c1d600e026fe1af95a78
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
