{% extends '//bin/mariadb/t/ix.sh' %}

{% block git_sha %}
10e4d193d47d0ceeda7dcb2140675759264a5f3b8852a8807e0683c00a077ff7
{% endblock %}

{% block git_repo %}
https://github.com/MariaDB/server.git
{% endblock %}

{% block git_branch %}
mariadb-11.2.3
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
