{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59c.tgz
99f8ac3c1d8a30b913d509f1969a4aaa
{% endblock %}

{% block bld_tool %}
bin/groff
{% endblock %}

{% block build %}
sh Build.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp mksh ${out}/bin
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
