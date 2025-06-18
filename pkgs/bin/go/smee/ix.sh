{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gosmee
{% endblock %}

{% block version %}
0.26.1
{% endblock %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3e46385324740daaab407bb0b8e70eb9b723735e9d2e0942907ff1124eb88045
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosmee.bin ${out}/bin/gosmee
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
