{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
userspace-rcu
{% endblock %}

{% block version %}
0.15.4
{% endblock %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-{{self.version().strip()}}.tar.bz2
11a14a7660ac9ba9c0bbd3b2d81718523d27dc6c8a9dfabd5e401b406673ee3a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}
