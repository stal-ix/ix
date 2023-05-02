{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.38.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:d0c184cccccf70af50effbd2b74410f28202db39a85db72a2c981b199b563929
{% endblock %}

{% block go_sha %}
sha:14c2ef7ebb66b17d78fb81015266ca05763fa4b0927646c3480e7b3abb5180c8
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
