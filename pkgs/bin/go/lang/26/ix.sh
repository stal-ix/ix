{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.26.2
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
4f64360b9291272ac7cb0386aebdad394be0875aaaeec3b60c9a992b40e28680
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/25
{% endblock %}
