{% extends '//bin/mariadb/t/ix.sh' %}

{% block pkg_name %}
MariaDB
{% endblock %}

{% block version %}
12.3.4
{% endblock %}

{% block git_sha %}
06c767284f2f92b8cc912e2ceb32cb2a1b9507b4e9567ac53d460af8d6774819
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
