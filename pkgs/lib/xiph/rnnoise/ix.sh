{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/rnnoise/-/archive/7f449bf8bd3b933891d12c30112268c4090e4d59/rnnoise-7f449bf8bd3b933891d12c30112268c4090e4d59.tar.bz2
sha:4af8f97c6b58319e78290f5bdc1b9d304eb9cb571b316cdf0eaab4507973046b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block c_rename_symbol %}
_celt_lpc
_celt_autocorr

celt_iir
pitch_search
remove_doubling
pitch_downsample
{% endblock %}
