{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.3.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:11ba1f827dcd3ae0572bb471bd52347224eadec03c9c3dd4452e401332ea3cb0
{% endblock %}

{% block go_sha %}
sha:ac38b34015eed40954c7f48110768bfcc721bbadf6d0326d36f03bf2ad85a9d1
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
