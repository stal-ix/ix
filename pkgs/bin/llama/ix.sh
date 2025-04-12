{% extends '//die/go/build.sh' %}

{% block version %}
1.4.0
{% endblock %}

{% block go_url %}
https://github.com/antonmedv/llama/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3a8829e942f38c85297e680c60cd72948038029f034100371e01b87c41401ee0
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp llama ${out}/bin/
{% endblock %}
