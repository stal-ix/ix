{% extends '//mix/template/template.sh' %}

{% block fetch %}
http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59c.tgz
99f8ac3c1d8a30b913d509f1969a4aaa
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
{% endblock %}

{% block build %}
dash ./Build.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp mksh ${out}/bin
{% endblock %}
