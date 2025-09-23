{% extends '//die/go/build.sh' %}

{% block pkg_name %}
u-root
{% endblock %}

{% block version %}
0.15.0
{% endblock %}

{% block go_url %}
https://github.com/u-root/u-root/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6c1c7e0a876e99dc4e95b00dd321395d50a1cfbc8eb77524ee1094b1e423b69f
{% endblock %}

{% block go_bins %}
u-root
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
