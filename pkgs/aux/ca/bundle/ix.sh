{% extends 'nopredict/ix.sh' %}

{% block predict_outputs %}
[{"path": "{{self.pem_path().strip()}}", "sum": "eda53fa55e2855da3b5bd0488b62bc6250d7cae082c24a66e5f136706b888426"}]
{% endblock %}
