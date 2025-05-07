{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.24.3
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
sha:4358c465e80e2124bee1969dd5e8f84d4f445a2c5a58b4b33f17bfe9e9deefed
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
