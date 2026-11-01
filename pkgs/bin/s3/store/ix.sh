{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/35.tar.gz
{% endblock %}

{% block go_sha %}
6595a4bd5df513c035c3e8b9d07fd30f45558abbc2e8d7e698a84a39549f9804
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
