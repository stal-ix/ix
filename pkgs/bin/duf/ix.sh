{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
sha:ebc3880540b25186ace220c09af859f867251f4ecaef435525a141d98d71a27a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}
