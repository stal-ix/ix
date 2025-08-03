{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gosmee
{% endblock %}

{% block version %}
0.28.0
{% endblock %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fda146b83ce458c0f8a3942177e05cf4297d5ecd812ccd2f5f536c4ed52c995c
{% endblock %}

{% block go_bins %}
gosmee.bin
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
