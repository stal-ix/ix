{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20250618
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
9651ce09d31b64a90625ab52af54fd90bf78cfe706c86991d0b44cb3033c0eb7
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
