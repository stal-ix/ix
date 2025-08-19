{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.25.0
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
7e5813e23f221dc193dec557379fe22607baa6fc2e321a1b8e39b658848a5f5f
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
