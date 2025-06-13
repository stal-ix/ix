{% extends '//die/c/make.sh' %}

{% block pkg_name %}
brightnessctl
{% endblock %}

{% block version %}
0.5.1
{% endblock %}

{% block fetch %}
https://github.com/Hummer12007/brightnessctl/archive/refs/tags/{{self.version().strip()}}.tar.gz
a68869e23f56ac4f2e28f1783002810ddbf10f95e1af9b48b2912fb169f46994
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
UDEVDIR=${out}/lib/udev/rules.d
{% endblock %}
