# Assembles a single character with the data supplied by the user

#def assemble_characters
#  characterid = SecureRandom.uuid
#  character = {"Character ID" => @characterid, "First Name" => @first_name, "Last Name" => @last_name, "Age" => @age, "Origin" => @origin, "Image" => @image}
#  write_character(character)
# end

# Read the JSON File and parse it into a hash
def read_characters()
  readfile = File.read("characters.json")
  return JSON.parse(readfile)
end

# Reads the Characters JSON file and appends the new character
#def write_character(character)
#  characters = read_characters()
#  characters << character
#  f = File.open("characters.json", "w")
#  f << characters.to_json
#  f.close
# end
