{% block shell %}
bld/sh
{% endblock %}

{% block box %}
bin/gnubox
{% endblock %}

{% block decompressor %}
bld/extract(std_box=bld/bootbox,opt=fast)
{% endblock %}
