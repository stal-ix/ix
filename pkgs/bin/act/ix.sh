{% extends '//die/go/build.sh' %}

{% block pkg_name %}
act
{% endblock %}

{% block version %}
0.2.95
{% endblock %}

{% block go_url %}
https://github.com/nektos/act/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
acd7d422b72fba1c309fa91cf74a042e08ffaf55f28b045eb861adc8fb39cd85
{% endblock %}

{% block go_bins %}
act
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
