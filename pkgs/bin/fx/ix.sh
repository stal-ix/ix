{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fx
{% endblock %}

{% block version %}
39.2.0
{% endblock %}

{% block go_url %}
https://github.com/antonmedv/fx/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d0e8f550414ffb5868d6785552725e45e4e097ce6ddddd8ea5475bcaf5d1fc95
{% endblock %}

{% block go_bins %}
fx
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
