{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.35.tar.gz
sha:fe5b2278d7b5b22058d139ec8961a09197d8fd26d7432d263a583fa9c1599d6d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
