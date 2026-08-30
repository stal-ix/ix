{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
userspace-rcu
{% endblock %}

{% block version %}
0.15.6
{% endblock %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-{{self.version().strip()}}.tar.bz2
850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}
