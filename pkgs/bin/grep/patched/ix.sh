{% extends '//bin/grep/ix.sh' %}

{% block install %}
{{super()}}

cat << EOF > ${out}/bin/egrep
#!/usr/bin/env sh
exec grep -E "\${@}"
EOF

cat << EOF > ${out}/bin/fgrep
#!/usr/bin/env sh
exec grep -F "\${@}"
EOF

chmod +x ${out}/bin/egrep ${out}/bin/fgrep
{% endblock%}
