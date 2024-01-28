{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}
