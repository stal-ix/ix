{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lf
{% endblock %}

{% block version %}
38
{% endblock %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d6d21a9b9bad20c2527125d5067e360bf96b5bbada318fedc6c85e9139c7dc2d
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
lf
{% endblock %}
