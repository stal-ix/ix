{% extends 't/ix.sh' %}

{% block pkg_name %}
gnupg
{% endblock %}

{% block version %}
2.5.17
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-{{self.version().strip()}}.tar.bz2
2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d
{% endblock %}
