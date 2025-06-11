{% extends '//die/go/build.sh' %}

{% block pkg_name %}
tun2socks
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block go_url %}
https://github.com/xjasonlyu/tun2socks/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
52b257ee7a7912b5c4daa996cc4f4eb7cfc825ca319abbecc0eae4cfa33d8caf
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block build %}
export GO111MODULE=on
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp tun2socks ${out}/bin/
{% endblock %}
