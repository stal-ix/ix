{% extends '//bin/coreutils/9/4/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.8
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
1be88d53f694671cf7fb85e7723dbd1de9131d031880161b452a0685b986296e
{% endblock %}
