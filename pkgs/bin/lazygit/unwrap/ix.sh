{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.35.tar.gz
{% endblock %}

{% block go_sum %}
sha:fe5b2278d7b5b22058d139ec8961a09197d8fd26d7432d263a583fa9c1599d6d
{% endblock %}

{% block go_sha %}
sha:54f01b0e3556ca026f12f2ecad60ca6bbf3580f9c9c8a5605ed9bb2f5a99565f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
