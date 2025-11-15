{% extends '//bin/postgresql/t/ix.sh' %}

{% block pkg_name %}
postgresql
{% endblock %}

{% block version %}
18.1
{% endblock %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v{{self.version().strip()}}/postgresql-{{self.version().strip()}}.tar.bz2
ff86675c336c46e98ac991ebb306d1b67621ece1d06787beaade312c2c915d54
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|if defined(USE_PRIVATE.*|if 0|' -i src/include/mb/pg_wchar.h
{% endblock %}
