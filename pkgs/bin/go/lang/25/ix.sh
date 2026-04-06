{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.25.5
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
e3860be3982c7d9189803b1390728e2757942204a1ab4cc9431db0c834e38b3a
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
