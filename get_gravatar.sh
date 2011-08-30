EMAIL="$(git config user.email)"
MD5=$(which md5sum || which md5)
SUM=$(echo -n $EMAIL | $MD5)
URL="http://gravatar.com/avatar/$SUM?s=512"

wget $URL -O gravatar.png
