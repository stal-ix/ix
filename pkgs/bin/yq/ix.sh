{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yq
{% endblock %}

{% block version %}
4.9.8
{% endblock %}

{% block go_url %}
https://github.com/mikefarah/yq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
19b326e86ba69107670bbfbf5dd459a3d1cef48e1b51d2c2a4a8c622161dcaac
{% endblock %}

{% block go_bins %}
yq
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
