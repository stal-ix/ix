{% extends '//die/go/build.sh' %}

{% block pkg_name %}
webhook
{% endblock %}

{% block version %}
2.8.3
{% endblock %}

{% block go_url %}
https://github.com/adnanh/webhook/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fbfb0c222f8d7d3d05261f1ce329560a4f1bb3516deed691ef1432825a00c046
{% endblock %}

{% block go_bins %}
webhook
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
