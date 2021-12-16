(
    set -eu

{% block install %}
{% endblock %}
)

(
    set -eu

{% block postinstall %}
{% include 'postinstall.sh' %}
{% endblock %}
)

(
    set -eu

{% block prepare_env %}
{% include 'env.sh' %}
{% endblock %}
)
