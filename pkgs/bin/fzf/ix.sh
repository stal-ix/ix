{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.31.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:df4edee32cb214018ed40160ced968d4cc3b63bba5b0571487011ee7099faa76
{% endblock %}

{% block go_sha %}
sha:053762e7b10d47324d7a2ccce9d3b90570c886f22128b85df2cfe200f6cfb9c4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
