{% extends 'nopredict/ix.sh' %}

{% block predict_outputs %}
[{"path": "{{self.pem_path().strip()}}", "sum": "02b03dcfa423f75b72b47dac373e795d57cde3b341231f5d45922132e3a87f5d"}]
{% endblock %}
