{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gh-dash
{% endblock %}

{% block version %}
4.26.3
{% endblock %}

{% block go_url %}
https://github.com/dlvhdr/gh-dash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
83fba2bd4d1c4d4bfc08e8e9128618a0a37c279b3b3d8d45bc25d807c4db3437
{% endblock %}

{% block go_bins %}
gh-dash
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
