{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/junegunn/fzf/archive/refs/tags/0.31.0.tar.gz
sha:df4edee32cb214018ed40160ced968d4cc3b63bba5b0571487011ee7099faa76
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
