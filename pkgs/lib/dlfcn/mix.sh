{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/7ce9986fc51a0de693823c684b0da878a77af3b0.zip
sha:c6367885a7484522e014ac5f7d202a416db017ac68ab04c15212743b84cfd61f
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/libdl.a ${out}/lib/libdlstub.a
{% endblock %}

{% block patch %}
sed -e 's|-std=c++20|-std=c++17|' -i Makefile
{% endblock %}
