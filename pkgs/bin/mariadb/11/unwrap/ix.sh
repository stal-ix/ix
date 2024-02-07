{% extends '//bin/mariadb/t/ix.sh' %}

{% block git_sha %}
4379fdb4bd1bff197b302b4a0ef234e3f4fc649c878a129a53bd72b64fb06892
{% endblock %}

{% block git_repo %}
https://github.com/MariaDB/server.git
{% endblock %}

{% block git_branch %}
mariadb-11.2.3
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
