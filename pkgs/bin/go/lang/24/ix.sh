{% extends '//bin/go/lang/22/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.24.0.tar.gz
sha:4f47402534b970bcf9f92a7af40de20f77ed7c1a295c5aec650b0f1e52c5e026
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
