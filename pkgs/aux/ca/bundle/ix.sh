{% extends 'nopredict/ix.sh' %}

{% block predict_outputs %}
[{"path": "{{self.pem_path().strip()}}", "sum": "23c47880a68d9a35cb03f92a51ff211117dd996a6cbdf3cd124eceb80728ddfa"}]
{% endblock %}
