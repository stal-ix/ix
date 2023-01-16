{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.36.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:4745443ac751b7e322a61fbf7b0e4a8c3c1c47a482a7e9d3d31230faed8f4443
{% endblock %}

{% block go_sha %}
sha:457de782e886c2cc1d4c16312b52e729d4c1e8838e76b4e7486410f21cd030aa
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
