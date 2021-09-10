import os

out = os.environ['out']
src = os.environ['src']

os.chdir(out)

for x in os.listdir(src):
    p = os.path.join(src, x)

    if 'tar.gz' in p:
        mix.untar(p)
