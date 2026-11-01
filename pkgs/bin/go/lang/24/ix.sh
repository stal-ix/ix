{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.24.13
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
d09fdbdc417359366a65731d221080e1240e268217873d2e61fdad8648a10ac1
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
