{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.24.6
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
d6f58fd519d140b7656b115ec9c57788d82346504149c262ba2e0e8eb78745ca
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
