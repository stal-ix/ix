{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.2.5.tar.xz
sha:3e1e518ffc912f86608a8cb35e4bd41ad1aec210df2a47aaa1f95e7f5576ef56
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
