{% extends '//die/c/autohell.sh' %}

{% block version %}
0.1.6.5
{% endblock %}

{% block fetch %}
https://github.com/skarnet/mdevd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e06b541d092e98b5bc9b92f5833ce4e56da10c0457444bcacf83604957b48ace
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/skalibs
{% endblock %}
