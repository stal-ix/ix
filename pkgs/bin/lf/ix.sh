{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lf
{% endblock %}

{% block version %}
40
{% endblock %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2b1a196a2c283fa590586a02a006b81e4b3e526aa6ec93240d9d45051eed0b63
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
lf
{% endblock %}
