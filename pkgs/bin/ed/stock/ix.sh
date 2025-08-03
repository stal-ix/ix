{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ed
{% endblock %}

{% block version %}
1.22
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-{{self.version().strip()}}.tar.lz
7eb22c30a99dcdb50a8630ef7ff3e4642491ac4f8cd1aa9f3182264df4f4ad08
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
