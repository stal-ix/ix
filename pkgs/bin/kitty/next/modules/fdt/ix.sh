{% extends '//bin/kitty/next/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
cp kitty/fast_data_types.so ${out}/lib/libfast_data_types.a
{% endblock %}
