{% extends '//bin/mariadb/t/ix.sh' %}

{% block pkg_name %}
MariaDB
{% endblock %}

{% block version %}
11.8.10
{% endblock %}

{% block git_sha %}
6995fbbd1b6fc2c147face86c4edb3d646fafdd993fab1391256ab50c5e9a8a4
{% endblock %}

{% block git_repo %}
https://github.com/MariaDB/server.git
{% endblock %}

{% block git_branch %}
mariadb-{{self.version().strip()}}
{% endblock %}

{% block git_refine %}
find . -type l -delete
{% endblock %}

{% block patch %}
cd libmariadb
find . -type f | while read l; do
    sed -e 's|decimal2string|xxx_decimal2string|' \
        -e 's|bin2decimal|xxx_bin2decimal|' \
        -e 's|decimal_bin_size|xxx_decimal_bin_size|' \
        -e 's|decimal_size|xxx_decimal_size|' \
        -i ${l}
done
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}
