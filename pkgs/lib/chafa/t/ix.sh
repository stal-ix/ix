{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/1.14.5.tar.gz
sha:788cb29e6d9cd29578c2040b3a11f69f4c9408e04f6c93c994c071e2a85d5ba4
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
