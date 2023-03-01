{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/pg83/portal/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sum %}
sha:c1eb931167c3e62f8790bd5c8b30c542da8484645fbc9a0c5ab1f1edacb5e9a7
{% endblock %}

{% block go_sha %}
sha:ceda49a9cc351bac547e45f549f5421b9211da097933421921a3c304328cd897
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp portal ${out}/bin/
{% endblock %}
