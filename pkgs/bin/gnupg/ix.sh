{% extends 't/ix.sh' %}

{% block pkg_name %}
gnupg
{% endblock %}

{% block version %}
2.5.22
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-{{self.version().strip()}}.tar.bz2
96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e
{% endblock %}
