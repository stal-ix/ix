{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v0.2.4.tar.gz
{% endblock %}

{% block go_sha %}
2285db7f26968b712b26a2a8daf6ee07c81cf99f75c830509dd9808f3458f6cb
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-look ${out}/bin/
{% endblock %}
