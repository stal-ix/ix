{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/which/which-2.23.tar.gz
sha:a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}
