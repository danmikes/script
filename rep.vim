# replace things
%s/"Department of Geosciences"/"Geosciences Department"/g
%s/\/data/\/dat/g
%s/\/documents/\/doc/g
%s/\/figures/\/fig/g
%s/"\usepackage[utf8]{inputenc}"^R"\usepackage[T1]{fontenc}"\
  /"\usepackage[T1]{fontenc}"^R"\usepackage[utf8]{inputenc}"/g
# maybe replace whole preamble by another for all publications and more packages on one line
write
quit