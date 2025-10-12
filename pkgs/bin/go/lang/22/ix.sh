{% extends '//bin/go/lang/20/ix.sh' %}

{% block version %}
1.22.12
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
36abf4c3c80af07b7ca0543b359384ef92b06fc4102efb7f5c02b0db5d9ec651
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
