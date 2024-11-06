{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v2.55.1.tar.gz
{% endblock %}

{% block go_sha %}
56840537c836bf5b12a14bc35e224ede419ab7ed1cf180c1dc78871d8b78b69b
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
