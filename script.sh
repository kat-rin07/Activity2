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
y=$(ls -l "$1" | awk '{print$3}')
z=$(ls -l "$1" | awk '{print $7, $8, $9}')
echo -e "/*\nFilename: $1\nOwner: $y\nLast Modified On: $z\n*/" > "$x"
cat "$1" >> "$x"
mv "$x" "$1"

echo "ALL DONE!"
