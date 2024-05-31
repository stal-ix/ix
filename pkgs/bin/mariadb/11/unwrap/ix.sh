{% extends '//bin/mariadb/t/ix.sh' %}

{% block git_sha %}
b2adea827313f884c1c8c2846b8a6e989b19907c1848be2b64a510e968d49fdb
{% endblock %}

{% block git_repo %}
https://github.com/MariaDB/server.git
{% endblock %}

{% block git_branch %}
mariadb-11.4.2
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
