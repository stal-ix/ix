{% if kind == 'bin' %}
{% block test_bin %}
echo 'exec tests'
{% endblock %}
{% endif %}

{% if kind == 'lib' %}
{% block test_lib %}
echo 'link tests'
{% endblock %}

{% if host.id == target.id %}
{% block test_execute %}
echo 'run linked tests'
{% endblock %}
{% endif %}
{% endif %}
