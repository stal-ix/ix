{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nmap
{% endblock %}

{% block version %}
7.993
{% endblock %}

{% block fetch %}
https://nmap.org/dist/nmap-{{self.version().strip()}}.tar.bz2
270e55f04915bfcecb5db8feb959d4c5ba86a48c094520a4f1c07571e1c79c59
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ssh/2
lib/kernel
lib/pcre/2
lib/linear
lib/openssl
{% endblock %}
