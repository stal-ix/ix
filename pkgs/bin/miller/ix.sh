{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v6.11.0.tar.gz
{% endblock %}

{% block go_sha %}
c5a353497bdfc98bb399f44dd95a4bf2a9614ef207e909ba17086e79df2f16c5
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mlr ${out}/bin/
{% endblock %}

