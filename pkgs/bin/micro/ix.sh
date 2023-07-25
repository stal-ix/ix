{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.11.tar.gz
{% endblock %}

{% block go_sha %}
f62313bdef160f44357d12414a50922e574b3d14bc25df84e7a7eb5011f6c369
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}
