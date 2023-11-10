{% extends '//bin/kitty/next/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
cp kittens/transfer/rsync.so ${out}/lib/librsync.a
{% endblock %}
