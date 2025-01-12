{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/beb42b7a83967a9b61af23061991bb18c6cd39bb.zip
{% endblock %}

{% block go_sha %}
be89ecf914e7c6e0274d7d001eff51328ace969b970d9569c577552209bdd0e6
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
