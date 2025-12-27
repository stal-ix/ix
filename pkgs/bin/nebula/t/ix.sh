{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula
{% endblock %}

{% block version %}
1.10.0
{% endblock %}

{% block go_url %}
https://github.com/slackhq/nebula/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4c8a416710d9d941daffa16cc91abccb1c332ef74eba66ed9c15231dfa0591d2
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
