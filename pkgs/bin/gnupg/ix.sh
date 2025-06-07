{% extends 't/ix.sh' %}

{% block pkg_name %}
gnupg
{% endblock %}

{% block version %}
2.5.7
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-{{self.version().strip()}}.tar.bz2
sha:bf1f4f51fda4863f6f2d461b33b83df6d8229e72e3e98f43013bf2127976414e
{% endblock %}
