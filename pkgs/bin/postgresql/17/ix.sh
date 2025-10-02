{% extends '//bin/postgresql/t/ix.sh' %}

{% block pkg_name %}
postgresql
{% endblock %}

{% block version %}
18.0
{% endblock %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v{{self.version().strip()}}/postgresql-{{self.version().strip()}}.tar.bz2
0d5b903b1e5fe361bca7aa9507519933773eb34266b1357c4e7780fdee6d6078
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|if defined(USE_PRIVATE.*|if 0|' -i src/include/mb/pg_wchar.h
{% endblock %}
