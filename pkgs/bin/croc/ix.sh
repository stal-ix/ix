{% extends '//die/go/build.sh' %}

{% block pkg_name %}
croc
{% endblock %}

{% block version %}
9.6.9
{% endblock %}

{% block go_url %}
https://github.com/schollz/croc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b14d2280182b0a2385da8a583975a86af68360485009ef4fb0b5af7f33e94711
{% endblock %}

{% block go_bins %}
croc
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
