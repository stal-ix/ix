{% extends '//bin/coreutils/9/4/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.11
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
2033b8a3049c06bff49a9e3cea72bdf4683bcd0cbeb975211dd56dbaf8b736ae
{% endblock %}
