{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/1.14.1.tar.gz
sha:b838d96989478b59841dbe9bafb308e58c4507375502cfd01273fea8daf77079
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
