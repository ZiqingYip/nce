cat contents_of_NCE3.txt |
	tr "[A-Z]" "[a-z]" |
	tr "[:punct:]" " "  |
	tr -s " " "\n" |
	sed 's/[0-9]//g' |
	sed 's/\r$//' |
	awk '{ if(length($0) > 2) { print $0 } }' |
	sort |
	uniq -c |
	awk '{print $2, $1}' |
	sort -rnk2 -k1 > word_count_of_NCE3.txt

