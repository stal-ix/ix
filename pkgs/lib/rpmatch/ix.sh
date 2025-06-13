{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
musl-rpmatch
{% endblock %}

{% block version %}
1.0
{% endblock %}

{% block fetch %}
https://github.com/pullmoll/musl-rpmatch/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dcbd41909bd69eaeedd20f03435b165406b514465249186ff1ca68d04fd35953
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
