{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/time/time-1.9.tar.gz
sha:fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
