{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block version %}
5c90477041c50f60a49d8da968ad56a5e0499396
{% endblock %}

{% block go_url %}
https://github.com/pg83/gofra/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
cf5ddbfc6290ed61c3affb52106e462c0f85698b9acc3170e5435599345b96e0
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin
{% endblock %}
