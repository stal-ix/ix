{% extends '//util/template.sh' %}

{% block configure %}
dash ./configure $COFLAGS --prefix="$out" {{self.coflags().replace('\n', ' ').strip()}}
{% endblock %}

{% block build %}
make -j $make_thrs
{% endblock %}

{% block install %}
make install
{% endblock %}
