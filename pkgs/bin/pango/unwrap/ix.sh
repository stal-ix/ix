{% extends '//lib/pango/t/ix.sh' %}

{% block install %}
{{super()}}

cat << EOF > ${out}/bin/gm
#!/usr/bin/env sh
exec xdg-open-stdin
EOF

chmod +x ${out}/bin/gm
{% endblock %}
