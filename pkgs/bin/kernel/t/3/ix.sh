{% extends '//bin/kernel/t/2/ix.sh' %}

{% block kernel_headers %}
lib/linux/headers/custom(kernel_url={{self.kernel_url().strip()}},kernel_sha={{self.kernel_sha().strip()}})
{% endblock %}

{% block slot %}
0
{% endblock %}
