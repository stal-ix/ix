{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/0.13.0.tar.gz
sha:7ad2ee259f35e8951233e4c9ad80968fb880f20d8202cb9c48f0b65f67d38e61
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}
