{% extends '//bin/postgresql/t/ix.sh' %}

{% block version %}
16.4
{% endblock %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v{{self.version().strip()}}/postgresql-{{self.version().strip()}}.tar.bz2
sha:971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f
{% endblock %}
