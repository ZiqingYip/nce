cat contents_of_NCE3.txt |
	tr "[A-Z]" "[a-z]" |  # 大写字母转为小写字母
	tr "[:punct:]" " "  |  # 标点符号转为空格，即完成切词（在准确性方面会有一定的误伤，比如 "won't" 会变为 "won t"）
	tr -s " " "\n" |  # 空格转为换行符，即每个单词一行
	sed 's/[0-9]//g' |  # 过滤掉数字
	sed 's/\r$//' |  # 过滤掉 ^M
	awk '{ if(length($0) > 2) { print $0 } }' |  # 过滤掉字符数小于等于2的行，比如因前面切词所产生的  s, t, th 等
	sort |  # 排序
	uniq -c |  # 去重，并统计每个单词的出现次数（即词频）
	awk '{print $2, $1}' |  # 调换单词和词频的位置
	sort -rnk2 -k1 > word_count_of_NCE3.txt  # 按词频从大到小排序，并通过重定向输出到文件中
