{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/1.12.3.tar.gz
sha:5694015defc5274e5f3b4c2788302536d7fb354da33c7d0e151f246c42efa221
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
