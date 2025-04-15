{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
userspace-rcu
{% endblock %}

{% block version %}
0.15.2
{% endblock %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-{{self.version().strip()}}.tar.bz2
sha:59f36f2b8bda1b7620a7eced2634f26c549444818a8313025a3bb09c0766a61d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}
