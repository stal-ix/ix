{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.32.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:3502c15faeb0a6d553c68ab1a7f472af08afed94a1d016427a8ab053ef149a8f
{% endblock %}

{% block go_sha %}
sha:e6e39303f99f0df430f4bd79b15a831d8180d856a32dc1809f82313c47f9f697
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
