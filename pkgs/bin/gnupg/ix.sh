{% extends 't/ix.sh' %}

{% block pkg_name %}
gnupg
{% endblock %}

{% block version %}
2.5.6
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-{{self.version().strip()}}.tar.bz2
sha:377f9d79af0ce494c0946dbe7c92197425bb522d7edd6f54acbc9869695131a8
{% endblock %}
