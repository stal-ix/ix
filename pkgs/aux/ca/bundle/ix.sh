{% extends 'nopredict/ix.sh' %}

{% block predict_outputs %}
[{"path": "{{self.pem_path().strip()}}", "sum": "ce864b93d58d8187c02c900ac3ed61241dab1821245c0b55990c19df07ac7415"}]
{% endblock %}
