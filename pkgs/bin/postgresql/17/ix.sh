{% extends '//bin/postgresql/t/ix.sh' %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v17.3/postgresql-17.3.tar.bz2
sha:13c18b35bf67a97bd639925fc581db7fd2aae4d3548eac39fcdb8da74ace2bea
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|if defined(USE_PRIVATE.*|if 0|' -i src/include/mb/pg_wchar.h
{% endblock %}
