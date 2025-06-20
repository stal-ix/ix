{% extends '//die/go/build.sh' %}

{% block pkg_name %}
bluetuith
{% endblock %}

{% block version %}
0.2.3
{% endblock %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2d815d153e0c5ab01911a3031eb185d036d61d241676444711a153fe309c7ce5
{% endblock %}

{% block go_bins %}
bluetuith
{% endblock %}
