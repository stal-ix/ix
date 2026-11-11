{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.26.11
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
12795b0ee12dbeea614c44a062bba27d26b751ca3defdaa20b31a02ec5c6e07e
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/25
{% endblock %}
