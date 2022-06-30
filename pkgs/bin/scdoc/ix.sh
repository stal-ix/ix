{% extends '//die/make.sh' %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/scdoc/archive/1.11.2.tar.gz
sha:e9ff9981b5854301789a6778ee64ef1f6d1e5f4829a9dd3e58a9a63eacc2e6f0
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
