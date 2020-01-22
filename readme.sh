sed -i -n '/##/q;p' README.md 
for d in */README.md ; do
  sed -i -n '/##/q;p' $d
  dir=`dirname "$d"`
  for sd in ./$dir/*/ ; do
    if [ -f $sd"README.md" ];then sed 's/^#/#&/' $sd"README.md"  >> $dir"/README.md"; fi
    if [ -f $sd"README.md" ];then echo $sd"README.md"; fi
  done
  if [ -f $dir"/README.md" ];then sed 's/^#/#&/' $dir"/README.md" >> README.md; fi
done

