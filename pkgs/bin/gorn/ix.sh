{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/14.tar.gz
{% endblock %}

{% block go_sha %}
54190b23c52681d44f4f8c5f8ab9febd61e4b8f06c32f3bd3e309df88750644f
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
