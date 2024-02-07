{% extends '//bin/go/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.0.tar.gz
sha:4245b5abef11f8e66a6f887d784f26758fd7dd8ccedad524429b470cce3fa8e3
{% endblock %}

{% block go_bootstrap %}
bin/go/21
{% endblock %}
