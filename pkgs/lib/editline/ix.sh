{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
editline
{% endblock %}

{% block version %}
1.17.1
{% endblock %}

{% block fetch %}
https://github.com/troglobit/editline/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:d65c5739c8ca388fa71feabc5aae506d052e1a6d288ee4e7fcab7efb07a3be74
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
