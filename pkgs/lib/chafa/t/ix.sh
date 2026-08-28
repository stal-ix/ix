{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
chafa
{% endblock %}

{% block version %}
1.18.2
{% endblock %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/{{self.version().strip()}}.tar.gz
9bdeba46446ac64ed61704fc54b5458cf0dca08b44031b26fbda7b78591984b8
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
