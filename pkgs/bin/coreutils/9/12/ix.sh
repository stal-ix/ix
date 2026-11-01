{% extends '//bin/coreutils/9/4/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.12
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
14cbf5a4de0c7b7fa3b9fa7fada4c58b2defe33336aa8fd83d7622c5c4ebdc13
{% endblock %}
