{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ed
{% endblock %}

{% block version %}
1.21.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-{{self.version().strip()}}.tar.lz
sha:d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
