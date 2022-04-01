{% block shell %}
bld/sh
{% endblock %}

{% block box %}
bin/gnubox(std_box=bld/bootbox)
{% endblock %}

{% block decompressor %}
bld/extract
{% endblock %}
