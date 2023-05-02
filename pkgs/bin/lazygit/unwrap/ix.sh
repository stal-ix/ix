{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.38.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:144f55267df7d51be9ae1dc3313707a7f6bcdf0c42eb330667c1fd661dec01b8
{% endblock %}

{% block go_sha %}
sha:5efc0c6290d9d47c0e0af791683701c2844a30a1461ad1c549daf960e26b691f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
