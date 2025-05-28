#!/bin/bash
# makedoc
# adding more to the top of the result file and making it executable make it self listed documentation file
# more command will list it by screens/pages 

DOCFILE="script_listing"
echo "#!/bin/more" > "$DOCFILE"
ls *.sh > tmplisting.txt
while IFS= read -r FILENAME; do
  if [ -f "$FILENAME" ]; then
    echo "==============================" >> "$DOCFILE"
    echo "SCRIPT NAME: $FILENAME " >> "$DOCFILE"
    echo "==============================" >> "$DOCFILE"
    echo "`cat $FILENAME`" >> "$DOCFILE"
    echo ""
    echo ""
fi
done < tmplisting.txt

chmod 755 "$DOCFILE"
rm tmplisting.txt
echo "$DOCFILE was created"
