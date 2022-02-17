{% extends '//bin/go/t/mix.sh' %}

{% block fetch %}
https://golang.org/dl/go1.4-bootstrap-20170531.tar.gz
d2cc61cb9f829b3510ee39c0c5568014
{% endblock %}

{% block go_cflags %}
export CGO_ENABLED=0
{% endblock %}

{% block patch %}
cat run.bash | grep -v 'time go test' > _ && mv _ run.bash
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
