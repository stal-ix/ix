{% extends '//die/go/build.sh' %}

{% block pkg_name %}
age
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block go_url %}
https://github.com/FiloSottile/age/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9988e89af327031431f8438d497231e0df9b90613d00f00a8a9f39b992e266cc
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
