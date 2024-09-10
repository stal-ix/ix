{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/1.14.4.tar.gz
sha:65b084173eb904c3e0b4eafd561cf0f676a17fe19b0d47b98118808f0646c92e
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
