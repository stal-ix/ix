{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula_ng
{% endblock %}

{% block version %}
e716311d5d1d77c184db7b4162041f1ebed77071
{% endblock %}

{% block go_url %}
https://github.com/pg83/nebula/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
83cc03605af643212727ae1e25803517b57874ad70dde38d8066f6689c2a5c68
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
