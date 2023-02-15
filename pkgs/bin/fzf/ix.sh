{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.38.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:75ad1bdb2ba40d5b4da083883e65a2887d66bd2d4dbfa29424cb3f09c37efaa7
{% endblock %}

{% block go_sha %}
sha:fc3f1910aeef3ec3ff6ee95fc34919d8c5ba210ac63916ae26f01e3f699cc0bf
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
