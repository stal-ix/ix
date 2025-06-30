{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hugo
{% endblock %}

{% block version %}
0.147.9
{% endblock %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5e6bf14a28f15f944df367580eaeea3eac48fd9e30e03d15cf4189ad950bd296
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
hugo
{% endblock %}
