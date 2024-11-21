{% extends '//bin/postgresql/t/ix.sh' %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v17.2/postgresql-17.2.tar.bz2
sha:82ef27c0af3751695d7f64e2d963583005fbb6a0c3df63d0e4b42211d7021164
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|if defined(USE_PRIVATE.*|if 0|' -i src/include/mb/pg_wchar.h
{% endblock %}
