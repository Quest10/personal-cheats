# To sum integers from a file or stdin, one integer per line:
printf '1\n2\n3\n' | awk '{ sum += $1} END {print sum}'

# To sum third column, separated by | , all lines that match in the first column the regexp /smiths/
awk -F '|' '$1 ~ /smiths/ {sum += $3} END {print sum}' inputfilename

# To sum third column, separated by | , grouped by first column
awk -F '|' '{a[$1] += $3} END{for (i in a) print i, a[i]}' filename.txt

# To use a specific character as separator to sum integers from a file or stdin:
printf '1:2:3' | awk -F ":" '{print $1+$2+$3}'

# To print a multiplication table:
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'

# To specify an output separator character:
printf '1 2 3' | awk 'BEGIN {OFS=":"}; {print $1,$2,$3}'
