echo "use database course_ingest;"
buff_n=${2:-1}
buff_i=0
buff=""
for line in `cat $1 | tail -n +2`; do
    part=""
    IFS=','; for i in $line; do
        w=${i%$'\r'}
        w=${w//\'/\\\'}

        if [ -z "$part" ]; then
            part="'${w}'"
        else
            part="$part,'${w}'"
        fi
    done
    IFS=' '
    if [ -z "$buff" ]; then
        buff="($part)"
    else
        buff="$buff,($part)"
    fi
    let buff_i=$buff_i+1
    if [[ "$buff_i" -eq $buff_n ]]; then
        echo "INSERT INTO student (nif, first_name, last_name, email) VALUES $buff;"
        buff=""
        buff_i=0
    fi
done
if [ ! -z "$buff" ]; then
   echo "INSERT INTO student (nif, first_name, last_name, email) VALUES $buff;"
fi