{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
byacc
{% endblock %}

{% block version %}
20241231
{% endblock %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-{{self.version().strip()}}.tgz
192c2fae048d4e7f514ba451627f9c4e612765099f819c19191f9fde3e609673
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
