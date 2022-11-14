{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.36.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:0b8630b09e28dc478fb2545c6fbe52e679b9a2e5dbe569982c9649655ab969c3
{% endblock %}

{% block go_sha %}
sha:33f9581f6394dbfb63274a0785f78c44a66d9ade3439daa9f2dd3f720421aadf
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
