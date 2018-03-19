xml.instruct!
xml.AddressBook do
  @contacts.each do |phone|
    xml.Contact do
      xml.FirstName phone.first_name
	  xml.Phone do
      xml.phonenumber phone.phone_number
      xml.accountindex 1
    end
  end
end
end