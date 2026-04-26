{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula_ng
{% endblock %}

{% block version %}
650b011fd913a28174522e376ae8c42c32ec55d7
{% endblock %}

{% block go_url %}
https://github.com/pg83/nebula/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4c231e7da17584521f7f332b454085438d44c99994a0a42b8205a7cc92d1f14e
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
