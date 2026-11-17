{% extends '//die/go/build.sh' %}

{% block pkg_name %}
act
{% endblock %}

{% block version %}
0.2.98
{% endblock %}

{% block go_url %}
https://github.com/nektos/act/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e5698515654b0ff37674b6c798024aade24fb21f3eaf422ecde5e05a86d42c47
{% endblock %}

{% block go_bins %}
act
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
