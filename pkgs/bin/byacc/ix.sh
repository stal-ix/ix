{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
byacc
{% endblock %}

{% block version %}
20260126
{% endblock %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-{{self.version().strip()}}.tgz
b618c5fb44c2f5f048843db90f7d1b24f78f47b07913c8c7ba8c942d3eb24b00
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
