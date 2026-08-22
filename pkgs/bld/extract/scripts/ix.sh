{% extends '//die/gen.sh' %}

{% block install %}
{% if all_system %}
mkdir -p ${out}/bin
cat << 'EOF' > ${out}/bin/ix_system_extract
{% include 'system_extract.py' %}
EOF
chmod +x ${out}/bin/ix_system_extract
{% else %}
: the extractor is a shell function, nothing to install
{% endif %}
{% endblock %}

{% block env %}
extract() (
{% if all_system %}
    ix_system_extract \${1} \${2}
{% else %}
    bsdcat \${2} | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components \${1}
{% endif %}
)

extract0() (
    extract 0 \${1}
)

extract1() (
    extract 1 \${1}
)
{% endblock %}
