{% extends '//bin/coreutils/9/1/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
sha:79b58daa199c63ce20f7919117734b2123949c92d179564f908e32890159cd48
{% endblock %}
