{% extends '//die/go/build.sh' %}

{% block pkg_name %}
goawk
{% endblock %}

{% block version %}
1.30.1
{% endblock %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
533b1f61ab36b25a292d3de12f90d9d9c4e02d8441c8f85fc4c8620391df59d2
{% endblock %}

{% block go_bins %}
goawk
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
