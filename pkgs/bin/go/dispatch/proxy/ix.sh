{% extends '//die/go/build.sh' %}

{% block pkg_name %}
go-dispatch-proxy
{% endblock %}

{% block version %}
7
{% endblock %}

{% block go_url %}
https://github.com/extremecoders-re/go-dispatch-proxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0dc42187668c3652bd063a234ccd747ef215e2bab7ed4e93c7f45a2285679b90
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp go-dispatch-proxy ${out}/bin/
{% endblock %}
