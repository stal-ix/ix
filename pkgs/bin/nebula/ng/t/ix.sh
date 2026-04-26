{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula_ng
{% endblock %}

{% block version %}
21f8627a82cb697be09224382042dbcfdfc53a35
{% endblock %}

{% block go_url %}
https://github.com/pg83/nebula/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ac64f8792804991ca13b52dbbf70046549b90d4be092b0e136a4e0001babd49e
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
