{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20240109.tgz
sha:f2897779017189f1a94757705ef6f6e15dc9208ef079eea7f28abec577e08446
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
