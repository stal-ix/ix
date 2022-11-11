{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/editline/archive/refs/tags/1.17.1.tar.gz
sha:d65c5739c8ca388fa71feabc5aae506d052e1a6d288ee4e7fcab7efb07a3be74
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
