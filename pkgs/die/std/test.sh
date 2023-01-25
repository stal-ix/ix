{% set test_bin %}
{% block test_bin %}
echo 'no bin tests'
{% endblock %}
{% endset %}

{% set test_lib %}
{% block test_lib %}
echo 'no link tests'
{% endblock %}
{% endset %}

{% set test_execute %}
{% block test_execute %}
echo 'no exec tests'
{% endblock %}
{% endset %}

{% set test_data %}
{% block test_data %}
echo 'no data tests'
{% endblock %}
{% endset %}

{% if native %}
  {% if bin %}
    {{test_bin}}
  {% endif %}

  {% if lib %}
    {{test_lib}}
    {{test_execute}}
  {% endif %}
{% else %}
  {{test_lib}}
{% endif %}

{% if aux %}
{{test_data}}
{% endif %}
