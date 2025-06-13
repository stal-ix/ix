{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
userspace-rcu
{% endblock %}

{% block version %}
0.15.3
{% endblock %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-{{self.version().strip()}}.tar.bz2
26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}
