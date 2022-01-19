{% block shell %}
bld/sh
{% endblock %}

{% block box %}
bin/gnubox
{% endblock %}

{% block decompressor %}
bld/extract(std_box=bin/bootbox,opt=fast)
{% endblock %}
