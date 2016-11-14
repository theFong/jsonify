# jsonify

A little json parser that reads a listed file then then converts it into json format used for importing into firebase.

#### Features to be implemented
- [ ] modularize json syntax
- [ ] handle multiple children

## Run
Option ```-i``` includes numbering of the list.
```
ruby jsonify.rb [read_file] [write_file] [option]
```

### Example 'Read' File
```
keywords
1. Race car
2. Pirate ship
3. Palm trees
4. Tulips
5. Pine cone
6. Space ship
```
### Example 'Write' .json
```
{
	"keywords": {
		"0":"Race car",
		"1":"Pirate ship",
		"2":"Palm trees",
		"3":"Tulips",
		"4":"Pine cone",
		"5":"Space ship"
	}
}
```
