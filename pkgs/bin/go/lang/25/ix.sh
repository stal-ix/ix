{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.25.3
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
8c062cdccde8fcb9311412f33b6c068db7799943e7f10c77d624769bc4c27973
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
