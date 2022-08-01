{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.35.tar.gz
{% endblock %}

{% block go_sum %}
sha:fe5b2278d7b5b22058d139ec8961a09197d8fd26d7432d263a583fa9c1599d6d
{% endblock %}

{% block go_sha %}
sha:c942da621fd6d23dc6bfe773ea8ce01fccb7cdd9346c8ad04fbb9558667d8c00
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
