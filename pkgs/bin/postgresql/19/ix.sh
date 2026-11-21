{% extends '//bin/postgresql/t/ix.sh' %}

{% block pkg_name %}
postgresql
{% endblock %}

{% block version %}
19.0
{% endblock %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v{{self.version().strip()}}/postgresql-{{self.version().strip()}}.tar.bz2
a89fd70efbad6a08c7dbed8d4872e3af30170d9e5ca9dc7906523be95b4e692d
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|if defined(USE_PRIVATE.*|if 0|' -i src/include/mb/pg_wchar.h
{% endblock %}
