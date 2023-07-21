{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.39.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:c8aa39536287aeca3e31e049405fd217940d2656cfb84968df516b43cba06977
{% endblock %}

{% block go_sha %}
sha:521472c88bbcb046a2e84d02509ec7336e27ac6ed4cc5122545e3376aad0f685
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
