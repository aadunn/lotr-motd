# random number
rand=$(( $RANDOM % 1000 + 0 ))

# grab quote line
quote=$( jq -r ".docs[${rand}].dialog" ~/Development/personal/lotr-motd/quotes.json )

# find character id and use that to lookup the character name
character_id=$( jq -r ".docs[${rand}].character" ~/Development/personal/lotr-motd/quotes.json )
character=$( jq -r ".docs[] | select(._id==\"${character_id}\") | .name" ~/Development/personal/lotr-motd/characters.json  )

# print quote
echo "\"${quote}\" — ${character}"
