{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/isacikgoz/tldr/archive/refs/tags/v1.0.0-alpha.tar.gz
{% endblock %}

{% block go_sha %}
2717595dbd1135b03a1db1f8c89f559967c626de08adf7d2e72cb6424d706d08
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/tldr
{% endblock %}

{% block go_bins %}
tldr
{% endblock %}
