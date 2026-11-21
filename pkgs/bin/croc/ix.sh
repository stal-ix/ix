{% extends '//die/go/build.sh' %}

{% block pkg_name %}
croc
{% endblock %}

{% block version %}
11.6.6
{% endblock %}

{% block go_url %}
https://github.com/schollz/croc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0bcd07d471e49bf9bddf72d81a9bf2ba92ad808686930bb0558bafee8433f58f
{% endblock %}

{% block go_bins %}
croc
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
