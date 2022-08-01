{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:ebc3880540b25186ace220c09af859f867251f4ecaef435525a141d98d71a27a
{% endblock %}

{% block go_sha %}
sha:3045fc5ef439d0244d623ec470bf6967f41b23b21531b4814fb3d054fbdf384e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}
