{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/webview/webview/archive/5f6562f358d9f50df7fef2214e3e0ee8de87d5dc.zip
sha:76ac1db16cb1efb1be9817f99dd9e8421c5242d3fd885d69489132148d716ac4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gtk
lib/webkit
{% endblock %}

{% block build %}
c++ -c webview.cc
ar q libwebview.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib/
cp *.h ${out}/include/
{% endblock %}
