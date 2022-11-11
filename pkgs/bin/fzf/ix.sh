{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.35.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:645cf0e1521d5c518f99acdca841a8113a2f0f5d785cb4147b92fcfa257a1ad0
{% endblock %}

{% block go_sha %}
sha:a15db8fa661de46fb4817ec5455402829087f20f3bd08171fefb5af9e05cb19a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
