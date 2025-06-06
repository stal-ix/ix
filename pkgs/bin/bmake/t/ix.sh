{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20250528
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
sha:0dc389a5e0298aa585353b60796d5d632de660dade58d00acd60ad722846c9a3
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
