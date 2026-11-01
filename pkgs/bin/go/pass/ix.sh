{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gopass
{% endblock %}

{% block version %}
1.17.4
{% endblock %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2227a9c0b6a7211d3bd49b6b36e71921efafaf4e4bd31a291f82b39b165104a8
{% endblock %}

{% block go_bins %}
gopass
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
