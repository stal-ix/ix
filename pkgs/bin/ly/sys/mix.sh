{% extends '//bin/ly/mix.sh' %}

{% block bld_libs %}
lib/pam/unix
{{super()}}
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/usr.*reset|/bin/reset|' \
        -e 's|.*tput cnorm.*|dgn_reset();|'    \
        -e 's|/tmp/|/var/run/ly/|' \
        -i ${l}
done

{{super()}}
{% endblock %}

{% block install %}
{{super()}}

cat << EOF > ${out}/etc/pam.d/ly
auth       required   pam_unix.so
account    required   pam_unix.so
password   required   pam_unix.so
session    required   pam_unix.so
EOF
{% endblock %}
