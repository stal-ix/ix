{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v1.10.2.tar.gz
{% endblock %}

{% block go_sha %}
7d24d35d8c2f5ad3567d520d259a830592598ee270c5272d70332187ab323218
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sing-box ${out}/bin/
{% endblock %}
