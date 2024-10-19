{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/go-gost/gost/archive/1fa5067d1450c7d0c7c4bfb5cbddc7ddbb49f76c.zip
{% endblock %}

{% block go_sha %}
9bf67cf61bcf4ba1645e601104fff3975c137346129ba17c5cc59cf32c709aee
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/gost
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gost ${out}/bin/
{% endblock %}
