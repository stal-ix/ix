(
{% block install %}
echo 'do install'
{% endblock %}
)

(
{% block postinstall %}
{% include 'postinstall.sh' %}
{% endblock %}
)

(
{% block prepare_env %}
{% include 'env.sh' %}
{% endblock %}
)
