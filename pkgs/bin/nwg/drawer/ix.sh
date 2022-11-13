{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.4.tar.gz
{% endblock %}

{% block go_sum %}
sha:44f0d25c3885fdc47dafb65bc5dd30c27cbf6a244ea31c58e61c6abf12be2193
{% endblock %}

{% block go_sha %}
sha:147c9acaa1943a153b6f2b13a74d449f7ec26dc0dae6e643368fc5f7c53fd3f7
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
