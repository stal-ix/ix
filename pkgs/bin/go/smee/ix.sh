{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gosmee
{% endblock %}

{% block version %}
0.28.3
{% endblock %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4b9c1da19e97acf618729a6f89aa9156d5a0a08a1a0e09388065afcea9323fe0
{% endblock %}

{% block go_bins %}
gosmee.bin
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
