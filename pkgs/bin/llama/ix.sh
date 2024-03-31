{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/antonmedv/llama/archive/refs/tags/v1.4.0.tar.gz
{% endblock %}

{% block go_sha %}
3a8829e942f38c85297e680c60cd72948038029f034100371e01b87c41401ee0
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp llama ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
