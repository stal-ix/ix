{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/refs/tags/v0.7.0.tar.gz
sha:4840425013b95b49120aeb87d4d4e7d83f8956e847a537e1e6dd7f58a4b643b4
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/webp
lib/hypr/lang
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}
