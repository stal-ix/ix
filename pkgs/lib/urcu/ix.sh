{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-0.13.2.tar.bz2
sha:1213fd9f1b0b74da7de2bb74335b76098db9738fec5d3cdc07c0c524f34fc032
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
