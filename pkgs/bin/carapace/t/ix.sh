{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/carapace-sh/carapace-bin/archive/refs/tags/v1.1.0.tar.gz
{% endblock %}

{% block go_sha %}
9ef056d88d744be9739de5249529df6d3d51d7df8f724f9be7e00ffc5ea1e8a6
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
