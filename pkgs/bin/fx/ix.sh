{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fx
{% endblock %}

{% block version %}
40.0.1
{% endblock %}

{% block go_url %}
https://github.com/antonmedv/fx/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
65c60531287c6d9529e2aaae5902329d853f333566612527c8ceef222a9aa915
{% endblock %}

{% block go_bins %}
fx
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
