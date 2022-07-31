{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.10.tar.gz
{% endblock %}

{% block go_sum %}
sha:d849751fcd70eba48bf3e15c3cc665f818fe77e5ac7819d0afe2123dc258aedc
{% endblock %}

{% block go_sha %}
sha:e753ac47242a1c7000f30cf133aee4989ccadfce9565c61c07827a1e8ba019ea
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}
