{% extends '//bin/postgresql/t/ix.sh' %}

{% block pkg_name %}
postgresql
{% endblock %}

{% block version %}
16.16
{% endblock %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v{{self.version().strip()}}/postgresql-{{self.version().strip()}}.tar.bz2
9d5cd8633043b75740d5d59749c6b7365e6aeb53c47098b1a5e80bb18f87881a
{% endblock %}
