{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ipget
{% endblock %}

{% block version %}
0.11.1
{% endblock %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
eb8e74125475a271cb408226cd10b7c8c697f0fc94da948c3359c5dd9f91fa9b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ipget ${out}/bin/
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
