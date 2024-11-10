{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.56.1.tar.gz
{% endblock %}

{% block go_sha %}
ba49d88a7ef9de99003605c2ef9909c8162e762b74180f563fcd951ad0c657aa
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
