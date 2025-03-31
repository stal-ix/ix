{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v0.61.0.tar.gz
{% endblock %}

{% block go_sha %}
e4517d09310cb84c34b367acdc190322a199f2bfea8dcc180f7c1032788ec02b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
