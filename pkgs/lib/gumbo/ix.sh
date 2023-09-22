{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/0.12.0.tar.gz
sha:f4820b8028b07406ba24ac74ef77057f5d9871f1b17c5486ad78e3da6e541e51
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
