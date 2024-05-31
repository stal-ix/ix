{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/slackhq/nebula/archive/refs/tags/v1.9.1.tar.gz
{% endblock %}

{% block go_sha %}
45d8636ad63553b3c05be12f054a308dc854638cdcb3ad13fee26c2f4ac3fd2e
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
