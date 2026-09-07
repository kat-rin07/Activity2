if [ -f "$1" ]; then
	echo "File Exists!"
else
	echo "ERROR"
	echo "File Does Not Exist"
	exit 1
fi 

if [[ "$1" == *.c ]]; then
	echo "File is c source file!"
else
	echo "ERROR"
	echo "File is not c source file"
	exit 1
fi

x=$(mktemp)
echo -e "/*\nFilename: $1\nOwner: $(whoami)\nLast Modified On: $(date)\n*/" > "$x"
cat "$1" >> "$x"
mv "$x" "$1"
