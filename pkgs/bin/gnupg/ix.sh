{% extends 't/ix.sh' %}

{% block pkg_name %}
gnupg
{% endblock %}

{% block version %}
2.4.8
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-{{self.version().strip()}}.tar.bz2
b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616
{% endblock %}
