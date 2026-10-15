{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yq
{% endblock %}

{% block version %}
4.54.1
{% endblock %}

{% block go_url %}
https://github.com/mikefarah/yq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7bb70987780eecf56afd04f420b53839953524cbc2282736374591faa3670f0a
{% endblock %}

{% block go_bins %}
yq
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
