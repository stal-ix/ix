{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
sha:f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}
