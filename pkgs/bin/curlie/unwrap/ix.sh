{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/rs/curlie/archive/refs/tags/v1.6.9.tar.gz
{% endblock %}

{% block go_sha %}
f08e8fcbd57cadb644a8b52ad19fdafcb0575062c30d3d17d4d147fb61d2d21c
{% endblock %}

{% block patch %}
rm curlie
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp curlie ${out}/bin/
{% endblock %}
