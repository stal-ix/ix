{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.31.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:df4edee32cb214018ed40160ced968d4cc3b63bba5b0571487011ee7099faa76
{% endblock %}

{% block go_sha %}
sha:66438bdf8de2e0e65098584424dbd84d0c5d1daad2f089e00a943b4a75a0c14d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
