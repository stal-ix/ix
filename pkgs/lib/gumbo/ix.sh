{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/0.12.1.tar.gz
sha:c0bb5354e46539680724d638dbea07296b797229a7e965b13305c930ddc10d82
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
