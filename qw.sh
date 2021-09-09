v_a_b=1
v_b_c=2
x="a"
y="b"

z=v_"$x"_"$y"

eval "zz=\${$z}"

echo $zz
