# Change class Array to include method random_element
class Array
  def random_element
    self[rand(length)]
  end
end


## FIRST NAMES
# This should eventually read from db or json
all_first_names_male = ["Thomas","Ahmed","Steven","Benyamin","Peter","Arik","Roberto","Jean"]
all_first_names_female = ["Maria","Aisha","Brigitte","Rachel","Helena","Erika","Kristen","Anne"]

## LAST NAMES
# This should eventually read from db or json
all_last_names = ["Brooks","Gagarin","Olivier","Cohen","King","Peterson","Gutierrez","Alonso"]

# Randomize
@sample_first_name_male = all_first_names_male.random_element
@sample_first_name_female = all_first_names_female.random_element
@sample_last_name = all_last_names.random_element
