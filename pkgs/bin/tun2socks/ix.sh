{% extends '//die/go/build.sh' %}

{% block pkg_name %}
tun2socks
{% endblock %}

{% block version %}
2.7.0
{% endblock %}

{% block go_url %}
https://github.com/xjasonlyu/tun2socks/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
caac72060e7e569d17a1ed1d9035f448bf26c6e660c2d26a3e159e8b33967345
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block build %}
export GO111MODULE=on
{{super()}}
{% endblock %}

{% block go_bins %}
tun2socks
{% endblock %}
