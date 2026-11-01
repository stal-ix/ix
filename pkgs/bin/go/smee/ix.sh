{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gosmee
{% endblock %}

{% block version %}
0.32.1
{% endblock %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d5d65f03436471061518421c7d9cb3fe17f59cd7cb89f061f6b436ef9ad28bdc
{% endblock %}

{% block go_bins %}
gosmee.bin
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
