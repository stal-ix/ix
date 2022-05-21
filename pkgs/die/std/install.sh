(
{% block install %}
echo 'do install'
{% endblock %}
)

(
{% block postinstall %}
{% if boot %}
{% if bin %}
rm -rf ${out}/lib ${out}/include
{% else %}
: skip
{% endif %}
{% else %}
{% include 'postinstall.sh' %}
{% endif %}
{% endblock %}
)

(
{% block prepare_env %}
{% include 'env.sh' %}
{% endblock %}
)
