{% extends '//bin/postgresql/t/ix.sh' %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v17.0/postgresql-17.0.tar.bz2
sha:7e276131c0fdd6b62588dbad9b3bb24b8c3498d5009328dba59af16e819109de
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|if defined(USE_PRIVATE.*|if 0|' -i src/include/mb/pg_wchar.h
{% endblock %}
