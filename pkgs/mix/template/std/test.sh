{% if kind == 'bin' %}
{% block test_bin %}
echo 'no exec tests'
{% endblock %}
{% endif %}

{% if kind == 'lib' %}
{% block test_lib %}
echo 'no link tests'
{% endblock %}

{% if host.id == target.id %}
{% block test_execute %}
echo 'no run linked tests'
{% endblock %}
{% endif %}
{% endif %}

{% if kind == 'dat' %}
{% block test_data %}
echo 'no data tests'
{% endblock %}
{% endif %}
