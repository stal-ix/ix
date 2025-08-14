{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ed
{% endblock %}

{% block version %}
1.22.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-{{self.version().strip()}}.tar.lz
1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
