{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gopass
{% endblock %}

{% block version %}
1.15.18
{% endblock %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1f88e4ea624688250b5700fbb214f32aabdf1b46d75b2270ed186984f5e602fa
{% endblock %}

{% block go_bins %}
gopass
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
