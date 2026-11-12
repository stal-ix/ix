{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
cabextract
{% endblock %}

{% block version %}
1.12
{% endblock %}

{% block fetch %}
https://www.cabextract.org.uk/cabextract-{{self.version().strip()}}.tar.gz
8f39ad5f9c076b9c62c67dea4f8649e75dcc16899a2d8122ca32ba68262cb713
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
