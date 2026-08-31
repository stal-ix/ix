{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yq
{% endblock %}

{% block version %}
4.53.6
{% endblock %}

{% block go_url %}
https://github.com/mikefarah/yq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e688e1a2ed8c1e9ffbc8233c572a8affb9b85b3720624a68a95c7071bb8ff2fe
{% endblock %}

{% block go_bins %}
yq
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
