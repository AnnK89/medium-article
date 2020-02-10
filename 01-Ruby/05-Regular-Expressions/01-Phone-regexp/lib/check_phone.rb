REGEX_1 = /^\+33[1-9]\d{8}/
REGEX_2 = /^0[1-9]{8}/

def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number = phone_number.gsub(/\s|-/, "")

  (phone_number.match? REGEX_1) || (phone_number.match? REGEX_2)
end
