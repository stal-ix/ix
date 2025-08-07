{% extends 't/ix.sh' %}

{% block pkg_name %}
gnupg
{% endblock %}

{% block version %}
2.5.10
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-{{self.version().strip()}}.tar.bz2
5a2f2faf411bbf87ed1a3e557cf20e05f75b050b3ae8a5ef7837aabd065f9d70
{% endblock %}
