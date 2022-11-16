{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/releases/download/1.2.0/exfatprogs-1.2.0.tar.xz
sha:56d9a49465deafc367d428afc71c8098705a30ee19a3cdf3c5320650b8880742
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
