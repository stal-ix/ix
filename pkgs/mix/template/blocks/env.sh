cat << EOF > ${out}/env
{% block env %}
{% endblock %}
EOF

(
    set -eu

    {% block autoenv %}
    {% endblock %}
) >> ${out}/env
