{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lf
{% endblock %}

{% block version %}
36
{% endblock %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e38e7041ebc075680952421f039ddc3e1dbd728d478dbfbb79032bdc12a49d81
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
lf
{% endblock %}
