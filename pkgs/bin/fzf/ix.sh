{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.32.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:3502c15faeb0a6d553c68ab1a7f472af08afed94a1d016427a8ab053ef149a8f
{% endblock %}

{% block go_sha %}
sha:ae4f0b0d7155c5db5669dd03da910821d2c2f715c060039a81424758f4db84fa
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
