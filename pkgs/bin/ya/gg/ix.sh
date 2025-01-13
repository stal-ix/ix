{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/0e050f34a5fd8ad4430268da051541c7f3692e71.zip
{% endblock %}

{% block go_sha %}
9a02d4762f3dd68dd1c7ca48143056a4e7a1cb273f4e996c5f21a2047e37155f
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
