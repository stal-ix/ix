{% if kind == 'bin' %}
 {% block test_bin %}
 {% endblock %}
{% endif %}

{% if kind == 'lib' %}
 {% block test_lib %}
 {% endblock %}

 {% if host.id == target.id %}
  {% block test_execute %}
  {% endblock %}
 {% endif %}
{% endif %}
