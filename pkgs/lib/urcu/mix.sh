{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-0.13.1.tar.bz2
sha:3213f33d2b8f710eb920eb1abb279ec04bf8ae6361f44f2513c28c20d3363083
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
