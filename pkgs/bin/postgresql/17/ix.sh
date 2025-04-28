{% extends '//bin/postgresql/t/ix.sh' %}

{% block pkg_name %}
postgresql
{% endblock %}

{% block version %}
17.4
{% endblock %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v{{self.version().strip()}}/postgresql-{{self.version().strip()}}.tar.bz2
sha:c4605b73fea11963406699f949b966e5d173a7ee0ccaef8938dec0ca8a995fe7
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|if defined(USE_PRIVATE.*|if 0|' -i src/include/mb/pg_wchar.h
{% endblock %}
