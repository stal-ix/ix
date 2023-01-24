{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.37.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:0044809beda82ba1a6936d5472cb749eef34785e8ecd4694936e39bf0ca9258b
{% endblock %}

{% block go_sha %}
sha:3f2b93b65b3dc7e323fd75879f373ce954c2858fac7ba845f6fc6b3d2f61f1e6
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
