for f in *.pdf; do
#cp $f ${f/pdf/jpg}
#mv $f ${f/pdf/jpg}
convert $f ${f/pdf/jpg}
done
