{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
chafa
{% endblock %}

{% block version %}
1.18.0
{% endblock %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/{{self.version().strip()}}.tar.gz
a357ca6c2546e46ed5e05d8dbb6d87de777ddb057e1758df8f3bfa18107519de
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
