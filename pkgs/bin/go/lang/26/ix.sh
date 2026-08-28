{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.26.7
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
a4d7ce0c5239c415360b93b7c76b41482ad920d2c42fd38d24c18308d2d49e05
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/25
{% endblock %}
