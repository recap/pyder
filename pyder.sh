grep -r --no-filename import *.py . | sed -e 's/^[ \t]*//' | grep -v ^# | grep ^import | sort -k2 | uniq | awk '{print "try:\n\t"$0"\nexcept ImportError as er:\n\tea = str(er).split(\" \")\n\tmod = ea[len(ea)-1].split(\".\")[0]\n\tprint mod\n\tpass\n"}' > ./imports-poq12-we-3.tmp
python ./imports-poq12-we-3.tmp | sort | uniq
rm -f ./imports-poq12-we-3.tmp
