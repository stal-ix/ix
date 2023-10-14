{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.43.0.tar.gz
{% endblock %}

{% block go_sha %}
417014bf5740c6bb4a2ad6b461d1ddaaafcbcd7943ce5d64e4a567d4840405c0
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
