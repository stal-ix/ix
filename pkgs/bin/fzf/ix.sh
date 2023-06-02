{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.41.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:12fdaaf0101c053596f98bd4789a048ea47d38c17a95f53a9bac793950cccc87
{% endblock %}

{% block go_sha %}
sha:27969076287cdd9815d9dc9241fd30ed2acbb364588fe7baded9063d025182e2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
