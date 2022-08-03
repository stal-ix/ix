{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:ebc3880540b25186ace220c09af859f867251f4ecaef435525a141d98d71a27a
{% endblock %}

{% block go_sha %}
sha:7c02d2b9dd23615dee460e829bba522bf6269aafa22792e8326285c8cc2c111f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}
