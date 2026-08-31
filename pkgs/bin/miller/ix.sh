{% extends '//die/go/build.sh' %}

{% block pkg_name %}
miller
{% endblock %}

{% block version %}
6.21.0
{% endblock %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5ce296149499a533c01bdfff7f75f920cf6500161f92070350a2542c42bc5fa6
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block go_bins %}
mlr
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
