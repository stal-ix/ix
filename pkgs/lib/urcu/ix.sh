{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-0.14.0.tar.bz2
sha:ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b2697d837a2239d4f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
