{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/isacikgoz/tldr/archive/refs/tags/v1.0.0-alpha.tar.gz
{% endblock %}

{% block go_sha %}
cd6127670cf3287df44eb4fdf703af251281b709d29fcf3ade2fccb7268e3e4f
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/tldr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp tldr ${out}/bin/
{% endblock %}
