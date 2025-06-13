{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
acce203a95f1fbbcfdc75abdf88cbe6473e5ff97f99757263d7e195eb4f8640d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gtk/3
lib/vte/3
{% endblock %}

{% block build %}
cc -o og gtk3/main.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp og ${out}/bin/
{% endblock %}
