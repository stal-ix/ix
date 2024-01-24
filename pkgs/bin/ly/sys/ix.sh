{% extends '//bin/ly/ix.sh' %}

{% block bld_libs %}
lib/pam/unix
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|/usr.*reset|/bin/reset|'      \
        -e 's|.*tput cnorm.*|dgn_reset();|' \
        -e 's|/tmp/|/var/run/ly/|' \
        -i ${l}
done
{% endblock %}
