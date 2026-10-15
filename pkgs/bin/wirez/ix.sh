{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/wirez/archive/refs/tags/8.tar.gz
{% endblock %}

{% block go_sha %}
074297d76aa62aae6c63aa40ad58cec73347b8bb4a8aadeeea0951d7e80270d7
{% endblock %}

{% block go_bins %}
wirez
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
