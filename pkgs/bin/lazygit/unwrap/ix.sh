{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.35.tar.gz
{% endblock %}

{% block go_sum %}
sha:fe5b2278d7b5b22058d139ec8961a09197d8fd26d7432d263a583fa9c1599d6d
{% endblock %}

{% block go_sha %}
sha:ec5affb6c864957a6a896e2004448c10f38ea911c7bc775aed401098bfc13f7c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
